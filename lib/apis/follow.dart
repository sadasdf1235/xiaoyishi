import 'package:dio/dio.dart';

import '../utils/https_client.dart';

class FollowApi {
  static String base = '/user/follow';

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