
import 'package:dio/dio.dart';
import '../utils/https_client.dart';

class UserApi {
  static String base = '/user/user';

  static Future<Response> getUserInfo({required int userId}) async {
    try {
      return await HttpsClient.get(url: '$base/userinfo', query: {'userId': userId});
    } catch (e) {
      // 处理错误，例如打印日志或抛出异常
      print('Error getting user info: $e');
      throw e; // 或者抛出一个更具体的异常
    }
  }

  static Future<Response> login(
      {required String phone, String password = "", String code = ""}) async {
    try {
      return await HttpsClient.post(
          url: '$base/login',
          data: {'phone': phone, 'password': password, 'code': code});
    } catch (e) {
      print('Error logging in: $e');
      throw e;
    }
  }

  static Future<Response> register(
      {required String username, String password = '', required String phone, required int gender}) async {
    try {
      return await HttpsClient.post(
          url: '$base/register',
          data: {'username': username, 'password': password, 'phone': phone, 'gender': gender});
    } catch (e) {
      print('Error registering: $e');
      throw e;
    }
  }
}