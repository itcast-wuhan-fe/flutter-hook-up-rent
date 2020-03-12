import 'dart:convert';

import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/models/general_type.dart';
import 'package:hook_up_rent/scoped_model/city.dart';
import 'package:hook_up_rent/utils/common_toast.dart';
import 'package:hook_up_rent/utils/scopoed_model_helper.dart';
import 'package:hook_up_rent/utils/store.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

import '../../config.dart';

class SearchBar extends StatefulWidget {
  final bool showLoaction; //展示位置按钮
  final Function goBackCallback; //回退按钮函数
  final String inputValue; // 搜索框输入值
  final String defaultInputValue; // 搜索框默认值
  final Function onCancel; //取消按钮
  final bool showMap; //展示地图按钮
  final Function onSearch; //用户点击搜索框触发
  final ValueChanged<String> onSearchSubmit;

  const SearchBar(
      {Key key,
      this.showLoaction,
      this.goBackCallback,
      this.inputValue = '',
      this.defaultInputValue = '请输入搜索词',
      this.onCancel,
      this.showMap,
      this.onSearch,
      this.onSearchSubmit})
      : super(key: key); // 用户输入搜索词后，点击键盘的搜索键触发

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _searchWord = '';
  TextEditingController _controller;
  FocusNode _focus;
  _onClean() {
    _controller.clear();
    setState(() {
      _searchWord = '';
    });
  }

  _saveCity(GeneralType city) async {
    if (city == null) return;
    ScopedModelHelper.getModel<CityModel>(context).city = city;
    var store = await Store.getInstance();
    var cityString = json.encode(city.toJson());
    store.setString(StoreKeys.city, cityString);
  }

  _changeLocation() async {
    var result = await CityPickers.showCitiesSelector(
        context: context, theme: ThemeData(primaryColor: Colors.green));

    String cityName = result?.cityName;
    if (null == cityName) return;

    var city = Config.availableCitys
        .firstWhere((city) => cityName.startsWith(city.name), orElse: () {
      CommonToast.showToast('该城市暂未开通！');
      return null;
    });
    if (city == null) return;
    _saveCity(city);
  }

  _getCity() async {
    var store = await Store.getInstance();
    var cityString = await store.getString(StoreKeys.city);
    if (null == cityString) return;
    var city = GeneralType.fromJson(json.decode(cityString));
    ScopedModelHelper.getModel<CityModel>(context).city = city;
  }

  @override
  void initState() {
    _focus = FocusNode();
    _controller = TextEditingController(text: widget.inputValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var city = ScopedModelHelper.getModel<CityModel>(context).city;
    if (null == city) {
      city = Config.availableCitys.first;
      _getCity();
    }
    return Container(
      child: Row(
        children: <Widget>[
          if (widget.showLoaction != null)
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () {
                  _changeLocation();
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.room, color: Colors.green, size: 16.0),
                    Text(
                      city.name,
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
          if (widget.goBackCallback != null)
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: widget.goBackCallback,
                child: Icon(Icons.chevron_left, color: Colors.black87),
              ),
            ),
          Expanded(
            child: Container(
              height: 34.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17.0),
                  color: Colors.grey[200]),
              margin: EdgeInsets.only(right: 10.0),
              child: TextField(
                focusNode: _focus,
                onTap: () {
                  if (null == widget.onSearchSubmit) {
                    _focus.unfocus();
                  }

                  if (widget.onSearch != null) widget.onSearch();
                },
                onSubmitted: widget.onSearchSubmit,
                textInputAction: TextInputAction.search,
                controller: _controller,
                style: TextStyle(fontSize: 14.0),
                onChanged: (String value) {
                  setState(() {
                    _searchWord = value;
                  });
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '请输入搜索词',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
                  contentPadding: EdgeInsets.only(top: 8.0, left: -10.0),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _onClean();
                    },
                    child: Icon(
                      Icons.clear,
                      size: 18.0,
                      color: _searchWord == '' ? Colors.grey[200] : Colors.grey,
                    ),
                  ),
                  icon: Padding(
                    padding: EdgeInsets.only(top: 4.0, left: 8.0),
                    child: Icon(
                      Icons.search,
                      size: 18.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (widget.onCancel != null)
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: widget.onCancel,
                child: Text(
                  '取消',
                  style: TextStyle(fontSize: 14.0, color: Colors.black),
                ),
              ),
            ),
          if (widget.showMap != null)
            GestureDetector(
              onTap: () {
                CommonToast.showToast('该功能暂未实现，敬请期待！');
              },
              child: CommonImage('static/icons/widget_search_bar_map.png'),
            ),
        ],
      ),
    );
  }
}
