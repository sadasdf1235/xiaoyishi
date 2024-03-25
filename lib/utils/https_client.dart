import 'dart:ffi';

import 'package:dio/dio.dart';

import '../constants/constants.dart';

class HttpsClient {
  static Dio dio = Dio();
  HttpsClient({String baseUrl = Constants.BASE_URL}) {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 5);
  }

  // Map<String, dynamic>? query
  Future get({required String url,Map<String, dynamic> query = const {}}) async {
    try {
      return await dio.get(url, queryParameters: query);
    } catch (e) {
      print(e);
    }
  }

  // post
  Future post({required String url, required Map<String, dynamic> data}) async {
    try {
      return await dio.post(url, data: data);
    } catch (e) {
      print(e);
    }
  }

  // upload
  Future upload({required String url, required Map<String, dynamic> data}) async {
    try {
      return await dio.post(
        url,
        data: data,
        onSendProgress: (int sent, int total) {
          print('$sent $total');
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
