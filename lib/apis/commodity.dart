import 'package:dio/dio.dart';
import '../utils/https_client.dart';

class CommodityApi {
  static String base = '/user/commodity';
  static Future<Response> getCommodities() async {
    try {
      return await HttpsClient.get(url: '$base/commodities');
    } catch (e) {
      rethrow;
    }
  }
}