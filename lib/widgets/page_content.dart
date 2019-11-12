// 1. 新建文件 /widgets/page_content.dart
// 2. 添加 material 依赖
import 'package:flutter/material.dart';
import 'package:hook_up_rent/routes.dart';

// 3. 编写无状态组件
class PageContent extends StatelessWidget {
  final String name;

// 4. 添加 name 参数
  const PageContent({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('当前页面：$name'),
      ),
      body: ListView(
        children: <Widget>[
          FlatButton(
            child: Text(Routes.home),
            onPressed: () {
              Navigator.pushNamed(context, Routes.home);
            },
          ),
          FlatButton(
            child: Text(Routes.login),
            onPressed: () {
              Navigator.pushNamed(context, Routes.login);
            },
          ),
          FlatButton(
            child: Text('不存在的页面'),
            onPressed: () {
              Navigator.pushNamed(context, '/aaaa');
            },
          ),
          FlatButton(
            child: Text('房屋详情页，id：2222'),
            onPressed: () {
              Navigator.pushNamed(context, '/room/2222');
            },
          ),
        ],
      ),
    );
  }
}

// 5. **使用 Scaffold**
