import 'package:dio/dio.dart';

import '../utils/https_client.dart';

class FollowApi {
  static String base = '/user/follow';

  static Future<Response> getFollowCount({required int userId}) async {
    try {
      return await HttpsClient.get(url: '${base}/count', query: {'userId': userId});
    } catch (e) {
      // 处理错误，例如打印日志或抛出异常
      print('Error getting user info: $e');
      rethrow; // 或者抛出一个更具体的异常
    }
  }
  static Future<Response> getFollowList({required int userId}) async {
    try {
      return await HttpsClient.get(url: '${base}/followList',query: {
        'userId' : userId
      });
    } catch (e) {
      print('获取关注列表失败$e');
      rethrow;
    }
  }
}