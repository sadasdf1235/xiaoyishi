import 'package:dio/dio.dart';

import '../utils/https_client.dart';

class PostApi {
  static String base = '/user/post';

  static Future<Response> getPostList() async {
    try {
      return await HttpsClient.get(url: '$base/postList');
    } catch (e) {
      print('获取帖子列表失败$e');
      rethrow;
    }
  }

}