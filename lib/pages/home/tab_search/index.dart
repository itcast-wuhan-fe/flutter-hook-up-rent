import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/models/room_list_item_data.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/data.dart';
import 'package:hook_up_rent/utils/dio_http.dart';
import 'package:hook_up_rent/utils/scopoed_model_helper.dart';
import 'package:hook_up_rent/widgets/room_list_item_widget.dart';
import 'package:hook_up_rent/widgets/search_bar/index.dart';

import 'filter_bar/filter_drawer.dart';
import 'filter_bar/index.dart';

class TabSearch extends StatefulWidget {
  const TabSearch({Key key}) : super(key: key);

  @override
  _TabSearchState createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  List<RoomListItemData> list = [];
  _onFilterBarChange(FilterBarResult data) async {
    var cityId = Uri.encodeQueryComponent(ScopedModelHelper.getAreaId(context));
    var area = Uri.encodeQueryComponent(data.areaId);
    var mode = Uri.encodeQueryComponent(data.rentTypeId);
    var price = Uri.encodeQueryComponent(data.priceId);
    var more = Uri.encodeQueryComponent(data.moreIds.join(','));
    String url = '/houses?cityId=' +
        '$cityId&area=$area&mode=$mode&price=$price&more=$more&start=1&end=20';
    var res = await DioHttp.of(context).get(url);
    var resMap = json.decode(res.toString());
    List dataMap = resMap['body']['list'];

    List<RoomListItemData> resList =
        dataMap.map((json) => RoomListItemData.fromJson(json)).toList();

    if (!mounted) return;

    setState(() {
      list = resList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: FilterDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[Container()],
        elevation: 0,
        title: SearchBar(
          showLoaction: true,
          showMap: true,
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 41.0,
            child: FilterBar(
              onChange: _onFilterBarChange,
            ),
          ),
          Expanded(
            child: ListView(
              children: list.map((item) => RoomListItemWidget(item)).toList(),
            ),
          )
        ],
      ),
    );
  }
}
