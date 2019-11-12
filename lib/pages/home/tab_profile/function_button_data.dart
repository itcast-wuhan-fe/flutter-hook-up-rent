import 'package:flutter/material.dart';
import 'package:hook_up_rent/scoped_model/auth.dart';
import 'package:hook_up_rent/utils/scopoed_model_helper.dart';

class FunctionButtonItem {
  final String imageUri;
  final String title;
  final Function onTapHandle;

  FunctionButtonItem(this.imageUri, this.title, this.onTapHandle);
}

final List<FunctionButtonItem> list = [
  FunctionButtonItem('static/images/home_profile_record.png', '看房记录', null),
  FunctionButtonItem('static/images/home_profile_order.png', '我的订单', null),
  FunctionButtonItem('static/images/home_profile_favor.png', '我的收藏', null),
  FunctionButtonItem('static/images/home_profile_id.png', '身份认证', null),
  FunctionButtonItem('static/images/home_profile_message.png', '联系我们', null),
  FunctionButtonItem('static/images/home_profile_contract.png', '电子合同', null),
  FunctionButtonItem('static/images/home_profile_house.png', '房屋管理', (context) {
    bool isLogin = ScopedModelHelper.getModel<AuthModel>(context).isLogin;
    if (isLogin) {
      Navigator.pushNamed(context, 'roomManage');
      return;
    }
    Navigator.pushNamed(context, 'login');
  }),
  FunctionButtonItem('static/images/home_profile_wallet.png', '钱包', null),
];
