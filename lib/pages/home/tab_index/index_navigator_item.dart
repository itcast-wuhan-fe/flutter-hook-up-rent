import 'package:flutter/material.dart';

import '../../../scoped_model/auth.dart';
import '../../../utils/common_toast.dart';
import '../../../utils/scopoed_model_helper.dart';

class IndexNavigatorItem {
  final String title;
  final String imageUri;
  final Function(BuildContext contenxt) onTap;

  IndexNavigatorItem(this.title, this.imageUri, this.onTap);
}

List<IndexNavigatorItem> indexNavigatorItemList = [
  IndexNavigatorItem('整组', 'static/images/home_index_navigator_total.png',
      (BuildContext context) {
    Navigator.of(context).pushReplacementNamed('home/1?rentType=true');
  }),
  IndexNavigatorItem('合租', 'static/images/home_index_navigator_share.png',
      (BuildContext context) {
    Navigator.of(context).pushReplacementNamed('home/1?rentType=false');
  }),
  IndexNavigatorItem('地图找房', 'static/images/home_index_navigator_map.png',
      (BuildContext context) {
    CommonToast.showToast('该功能暂未实现，敬请期待！');
  }),
  IndexNavigatorItem('去出租', 'static/images/home_index_navigator_rent.png',
      (BuildContext context) {
    bool isLogin = ScopedModelHelper.getModel<AuthModel>(context).isLogin;
    if (isLogin) {
      Navigator.pushNamed(context, 'roomManage');
      return;
    }
    Navigator.pushNamed(context, 'login');
  }),
];
