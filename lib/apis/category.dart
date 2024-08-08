import 'package:dio/dio.dart';

import '../utils/https_client.dart';

class CategoryApi {
  static String base = '/user/category';

  static Future<Response> getFirstCategory() async {
    try {
      return await HttpsClient.get(url: '$base/firstCategory');
    } catch (e) {
      // 处理错误，例如打印日志或抛出异常
      print('Error getting user info: $e');
      throw e; // 或者抛出一个更具体的异常
    }
  }

  static Future<Response> getSecondCategory({required int id}) async {
    try {
      return await HttpsClient.get(url: '$base/secondCategory', query: {'id': id});
    } catch (e) {
      // 处理错误，例如打印日志或抛出异常
      print('Error getting user info: $e');
      throw e; // 或者抛出一个更具体的异常
    }
  }
}