import 'package:hook_up_rent/config.dart';
import 'package:hook_up_rent/scoped_model/city.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class ScopedModelHelper {
  static T getModel<T extends Model>(BuildContext context) {
    return ScopedModel.of<T>(context, rebuildOnChange: true);
  }

  static String getAreaId(context) {
    return ScopedModelHelper.getModel<CityModel>(context).city?.id ??
        Config.availableCitys.first.id;
  }
}
