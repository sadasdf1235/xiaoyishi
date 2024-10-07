import 'package:dio/dio.dart';

import '../utils/https_client.dart';

class CollectApi {
  static String base = '/user/collect';

  /**
   * id
   * type 0-all 1-commodity 2-post
   */
  static Future<Response> getCollectList({required int id, required int type}) async {
    try {
      return await HttpsClient.get(url: '$base/list', query: {
        "userId": id,
        "type": type
      });
    } catch (e) {
      // 处理错误，例如打印日志或抛出异常
      print('Error getting user info: $e');
      throw e; // 或者抛出一个更具体的异常
    }
  }
}