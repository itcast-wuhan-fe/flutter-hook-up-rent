import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/models/room_list_item_data.dart';
// import 'package:hook_up_rent/pages/home/tab_search/data_list.dart';
import 'package:hook_up_rent/scoped_model/auth.dart';
import 'package:hook_up_rent/utils/dio_http.dart';
import 'package:hook_up_rent/utils/scopoed_model_helper.dart';
import 'package:hook_up_rent/widgets/common_floating_action_button.dart';
import 'package:hook_up_rent/widgets/room_list_item_widget.dart';

class RoomManagePage extends StatefulWidget {
  const RoomManagePage({Key key}) : super(key: key);

  @override
  _RoomManagePageState createState() => _RoomManagePageState();
}

class _RoomManagePageState extends State<RoomManagePage> {
  List<RoomListItemData> availableDataList = [];

  _getData() async {
    var auth = ScopedModelHelper.getModel<AuthModel>(context);
    if (!auth.isLogin) return;
    var token = auth.token;
    String url = '/user/houses';
    var res = await DioHttp.of(context).get(url, null, token);
    var resMap = json.decode(res.toString());
    List listMap = resMap['body'];

    var dataList =
        listMap.map((json) => RoomListItemData.fromJson(json)).toList();

    setState(() {
      availableDataList = dataList;
    });
  }

  @override
  void initState() {
    Timer.run(_getData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CommonFloatingActionButton('发布房源', () {
          var result = Navigator.of(context).pushNamed('roomAdd');
          result.then((value) {
            if (value == true) {
              _getData();
            }
          });
        }),
        appBar: AppBar(
          title: Text('房屋管理'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: '空置',
              ),
              Tab(
                text: '已租',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: availableDataList
                  .map((item) => RoomListItemWidget(item))
                  .toList(),
            ),
            ListView(
              children: List(),
              // dataList.map((item) => RoomListItemWidget(item)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
