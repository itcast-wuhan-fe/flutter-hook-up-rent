// 1. 新建文件 /pages/home/index.dart
// 2. 添加 material, page_content依赖
import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_info/index.dart';
import 'package:hook_up_rent/pages/home/tab_profile/index.dart';

import 'tab_index/index.dart';
import 'tab_search/index.dart';

Widget getView(index, String rentType) {
  var tabViewList = [
    TabIndex(),
    TabSearch(rentType),
    TabInfo(),
    TabProfile(),
  ];
  return tabViewList[index];
}

// 2. 需要准备 4 个 BottomNavigationBarItem

List<BottomNavigationBarItem> barItemList = [
  BottomNavigationBarItem(title: Text('首页'), icon: Icon(Icons.home)),
  BottomNavigationBarItem(title: Text('搜索'), icon: Icon(Icons.search)),
  BottomNavigationBarItem(title: Text('资讯'), icon: Icon(Icons.info)),
  BottomNavigationBarItem(title: Text('我的'), icon: Icon(Icons.account_circle)),
];

// 3. 编写无状态组件
class HomePage extends StatefulWidget {
  final String indexString;
  final String rentType;
  const HomePage(this.indexString, this.rentType, {Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// 1. 需要准备 4 个 tab 内容区（tabView）

  @override
  void initState() {
    super.initState();
    int paramIndex = int.tryParse(widget.indexString);
    var rentType = widget.rentType;
    if (null != paramIndex) {
      setState(() {
        _selectedIndex = paramIndex;
        _rentType = rentType;
      });
    }
  }

  // int _currentIndex = 0;
  int _selectedIndex = 0;
  String _rentType = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _rentType = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        // tabViewList[_selectedIndex]
        body: getView(_selectedIndex, _rentType),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: barItemList,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
