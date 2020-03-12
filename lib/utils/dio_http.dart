import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/scoped_model/auth.dart';
import 'package:hook_up_rent/utils/common_toast.dart';
import 'package:hook_up_rent/utils/scopoed_model_helper.dart';

import '../config.dart';
import '../routes.dart';

class DioHttp {
  Dio _client;
  BuildContext context;

  static DioHttp of(BuildContext context) {
    return DioHttp._internal(context);
  }

  DioHttp._internal(BuildContext context) {
    if (_client == null || context != this.context) {
      this.context = context;
      var options = BaseOptions(
          baseUrl: Config.BaseUrl,
          connectTimeout: 1000 * 10,
          receiveTimeout: 1000 * 5,
          extra: {'context': context},
          responseType: ResponseType.plain);
      Interceptor interceptor = InterceptorsWrapper(onResponse: (Response res) {
        if (null == res) return res;
        var status = json.decode(res.toString())['status'];
        if (404 == status) {
          CommonToast.showToast('接口地址错误！当前接口：${res.request.path}');
          return res;
        }
        if (status.toString().startsWith('4')) {
          ScopedModelHelper.getModel<AuthModel>(context).logout();

          if (ModalRoute.of(context).settings.name == Routes.loading) {
            return res;
          }

          // 当前请求为登录请求则不处理
          if (!res.request.path.startsWith('/user/login')) {
            CommonToast.showToast('登录过期');
            Navigator.of(context).pushNamed(Routes.login);
          }

          return res;
        }
        return res;
      });
      var client = Dio(options);
      client.interceptors.add(interceptor);

      this._client = client;
    }
  }
  Future<Response<Map<String, dynamic>>> get(String path,
      [Map<String, dynamic> params, String token]) async {
    var options = Options(headers: {'Authorization': token});
    return await _client.get(path, queryParameters: params, options: options);
  }

  Future<Response<Map<String, dynamic>>> post(String path,
      [Map<String, dynamic> params, String token]) async {
    var options = Options(headers: {'Authorization': token});
    return await _client.post(path, data: params, options: options);
  }

  Future<Response<Map<String, dynamic>>> postFormData(String path,
      [Map<String, dynamic> params, String token]) async {
    var options = Options(
        contentType: ContentType.parse('multipart/form-data'),
        responseType: ResponseType.plain,
        headers: {'Authorization': token});
    return await _client.post(path, data: params, options: options);
  }
}
