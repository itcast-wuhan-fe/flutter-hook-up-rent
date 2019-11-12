import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/scoped_model/auth.dart';
import 'package:hook_up_rent/utils/scopoed_model_helper.dart';

import 'dio_http.dart';

Future<String> uploadImages(List<File> files, BuildContext context) async {
  if (null == files) return Future.value('');
  if (0 == files.length) return Future.value('');

  var token = ScopedModelHelper.getModel<AuthModel>(context).token;
  var fromData = FormData();
  fromData.add("file",
      files.map((file) => UploadFileInfo(file, 'picture.jpg')).toList());

//准备url
  String url = '/houses/image';

//发送请求，处理返回
  var res = await DioHttp.of(context).postFormData(url, fromData, token);
  var data = json.decode(res.toString())['body'];
  String images = List<String>.from(data).join('|');

  return Future.value(images);
}
