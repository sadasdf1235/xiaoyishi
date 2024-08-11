import 'dart:io';

import 'package:dio/dio.dart';

import '../utils/https_client.dart';

class CommonApi {
  static const String base = '/common';
  static Future<Response> upload({required File file}) async {
    try {
      return await HttpsClient.uploadFile(url: '$base/upload', file: file);
    } catch (e) {
      // 处理错误，例如打印日志或抛出异常
      print('Error getting user info: $e');
      throw e; // 或者抛出一个更具体的异常
    }
  }
}