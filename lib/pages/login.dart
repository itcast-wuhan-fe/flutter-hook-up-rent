// 1. 新建文件 /pages/home/index.dart
// 2. 添加 material, page_content依赖
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/scoped_model/auth.dart';
import 'package:hook_up_rent/utils/common_toast.dart';
import 'package:hook_up_rent/utils/dio_http.dart';
import 'package:hook_up_rent/utils/scopoed_model_helper.dart';
import 'package:hook_up_rent/utils/store.dart';
import 'package:hook_up_rent/utils/string_is_null_or_empty.dart';

// 3. 编写无状态组件
class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  _loginHandle() async {
    var username = usernameController.text;
    var password = passwordController.text;

    if (stringIsNullOrEmpty(username) || stringIsNullOrEmpty(password)) {
      CommonToast.showToast('用户名或密码不能为空！');
      return;
    }
    const url = '/user/login';
    var params = {
      'username': username,
      'password': password,
    };

    var res = await DioHttp.of(context).post(url, params);
    var resMap = json.decode(res.toString());

    int status = resMap['status'];
    String description = resMap['description'] ?? '内部错误';
    CommonToast.showToast(description);

    if (status.toString().startsWith('2')) {
      String token = resMap['body']['token'];

      Store store = await Store.getInstance();
      await store.setString(StoreKeys.token, token);

      ScopedModelHelper.getModel<AuthModel>(context).login(token, context);

      Timer(Duration(seconds: 1), () {
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登陆'),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(30),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: '用户名', hintText: '请输入用户名'),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            TextField(
              controller: passwordController,
              obscureText: !showPassword,
              decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '请输入密码',
                  suffixIcon: IconButton(
                    icon: Icon(
                        showPassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            RaisedButton(
              color: Colors.green,
              child: Text(
                '登陆',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                _loginHandle();
              },
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('还没有账号，'),
                FlatButton(
                  child: Text(
                    '去注册～',
                    style: TextStyle(color: Colors.green),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'register');
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
// 4. 使用 PageContent
