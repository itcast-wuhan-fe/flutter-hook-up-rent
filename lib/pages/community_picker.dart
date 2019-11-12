import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/models/community.dart';
import 'package:hook_up_rent/utils/dio_http.dart';
import 'package:hook_up_rent/utils/scopoed_model_helper.dart';
import 'package:hook_up_rent/widgets/search_bar/index.dart';

class CommunityPickerPage extends StatefulWidget {
  CommunityPickerPage({Key key}) : super(key: key);

  @override
  _CommunityPickerPageState createState() => _CommunityPickerPageState();
}

class _CommunityPickerPageState extends State<CommunityPickerPage> {
  List<Community> dataList = [];

  _searchHandle(String value) async {
    var areaId = ScopedModelHelper.getAreaId(context);
    final url = '/area/community?name=$value&id=$areaId';
    var res = await DioHttp.of(context).get(url);
    var data = json.decode(res.toString())['body'];
    List<Community> resList = List<Community>.from(
        data.map((item) => Community.fromJson(item)).toList());

    setState(() {
      dataList = resList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SearchBar(
          onCancel: () {
            Navigator.of(context).pop();
          },
          goBackCallback: () {
            Navigator.of(context).pop();
          },
          onSearchSubmit: _searchHandle,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(10.0),
        child: ListView.separated(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.of(context).pop(dataList[index]);
              },
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: Text(dataList[index].name),
              ),
            );
          },
          separatorBuilder: (_context, _) => Divider(),
        ),
      ),
    );
  }
}
