import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('404'),
      ),
      body: Center(
          child: Container(
        margin: EdgeInsets.all(20),
        child: Column(children: [
          Text('您访问的页面还不存在！'),
          FlatButton(
            child: Text(
              '去首页～',
              style: TextStyle(color: Colors.green),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home/1');
            },
          )
        ]),
      )),
    );
  }
}
