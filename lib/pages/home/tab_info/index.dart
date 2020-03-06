import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/info/index.dart';
import 'package:hook_up_rent/utils/common_toast.dart';
import 'package:hook_up_rent/widgets/search_bar/index.dart';

class TabInfo extends StatefulWidget {
  const TabInfo({Key key}) : super(key: key);

  @override
  _TabInfoState createState() => _TabInfoState();
}

class _TabInfoState extends State<TabInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SearchBar(
          onSearch: () {
            CommonToast.showToast('该功能暂未实现，敬请期待！');
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
          ),
          Info(),
          Info(),
          Info(),
        ],
      ),
    );
  }
}
