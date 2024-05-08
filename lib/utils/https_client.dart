import 'dart:ffi';

import 'package:dio/dio.dart';

import '../constants/constants.dart';

class HttpsClient {
  static Dio dio = Dio();
  HttpsClient({String baseUrl = Constants.BASE_URL}) {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 5);
    dio.options.headers =  {
      'Authorization' : 'Bearer ' + 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJlMDNiZmI3NDZjMzM0NWMxOGE3NmU3Njc5MWMyMThjZiIsInN1YiI6IjEiLCJpc3MiOiJzZyIsImlhdCI6MTcxMzg2MzU0MywiZXhwIjoxNzE1MDczMTQzfQ.EuURV8-FZi_uxDOk_xf7-r__xUkVSTn7LFaubMPCpAY',
    };
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
  Future uploadFiles({required String url,required List files}) async {
    Future<FormData> createFormData() async {
      return FormData.fromMap({
        'name': 'dio',
        'date': DateTime.now().toIso8601String(),
        'files': files.map((e) async => await MultipartFile.fromFile(e)).toList()
      });
    }

    return await dio.post(url, data: await createFormData());
  }
}
