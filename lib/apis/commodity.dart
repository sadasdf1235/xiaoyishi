import 'package:dio/dio.dart';
import 'package:xiaoyishi/models/commodity/CommodityForm.dart';
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

  static Future<Response> addCommodity({required CommodityForm commodityForm}) async {
    try {
      return await HttpsClient.post(url: '$base/addCommodity',data: commodityForm.toJson());
    } catch (e) {
      rethrow;
    }
  }
}