import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/community_picker.dart';
import 'package:hook_up_rent/pages/home/index.dart';
import 'package:hook_up_rent/pages/loading.dart';
import 'package:hook_up_rent/pages/login.dart';
import 'package:hook_up_rent/pages/not_found.dart';
import 'package:hook_up_rent/pages/register.dart';
import 'package:hook_up_rent/pages/room_add/index.dart';
import 'package:hook_up_rent/pages/room_detail/index.dart';
import 'package:hook_up_rent/pages/room_manage/index.dart';
import 'package:hook_up_rent/pages/setting.dart';

class Routes {
//   1. 定义路由名称
  static String home = '/home/:index';
  static String login = '/login';
  static String register = '/register';
  static String roomDetail = '/roomDetail/:roomId';
  static String setting = '/setting';
  static String roomManage = '/roomManage';
  static String roomAdd = '/roomAdd';
  static String communityPicker = '/communityPicker';
  static String loading = '/loading';

// 2. 定义路由处理函数
  static Handler _homeHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return HomePage(params['index'][0],
        params['rentType'] == null ? '' : params['rentType'][0]);
  });
  static Handler _loginHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return LoginPage();
  });
  static Handler _registerHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return RegisterPage();
  });

  static Handler _notFoundHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return NotFoundPage();
  });

  static Handler _roomDetailHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return RoomDetailPage(
      roomId: params['roomId'][0],
    );
  });

  static Handler _settingHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return SettingPage();
  });

  static Handler _roomManageHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return RoomManagePage();
  });
  static Handler _roomAddHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return RoomAddPage();
  });
  static Handler _communityPickerHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return CommunityPickerPage();
  });
  static Handler _loadingHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return LoadingPage();
  });

// 3. 编写函数 configureRoutes 关联路由名称和处理函数
  static void configureRoutes(Router router) {
    router.define(home, handler: _homeHandler);
    router.define(login, handler: _loginHandler);
    router.define(register, handler: _registerHandler);
    router.define(roomDetail, handler: _roomDetailHandler);
    router.define(setting, handler: _settingHandler);
    router.define(roomManage, handler: _roomManageHandler);
    router.define(roomAdd, handler: _roomAddHandler);
    router.define(communityPicker, handler: _communityPickerHandler);
    router.define(loading, handler: _loadingHandler);
    router.notFoundHandler = _notFoundHandler;
  }
}
