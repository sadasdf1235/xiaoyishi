import 'dart:io';
import 'package:dio/dio.dart';
import 'package:xiaoyishi/utils/storage.dart';
import '../constants/constants.dart';

class HttpsClient {
  static final Dio dio = Dio();

  static void setup({String baseUrl = Constants.BASE_URL}) {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 5);
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      print('baseUrl---${options.baseUrl}');
      String? token = await Storage.getStringData(Constants.TOKEN);
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = token;
      }
      return handler.next(options);
    }, onError: (DioError err, handler) {
      // 错误处理逻辑
      print('err---${err}');
      return handler.next(err);
    }));
  }

  static Future<Response> get(
      {required String url, Map<String, dynamic> query = const {}}) async {
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> post(
      {required String url, required Map<String, dynamic> data}) async {
    return await dio.post(url, data: data);
  }

  static Future<Response> uploadFile(
      {required String url, required File file}) async {
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path),
    });
    var option = Options(method: "POST", contentType: "multipart/form-data");
    return await dio.post(url, data: formData, options: option);
  }

  static Future<Response> downloadFile(
      {required String url, required String savePath}) async {
    return await dio.download(url, savePath,
        onReceiveProgress: (int loaded, int total) {});
  }
}

// 在应用启动时调用设置方法
void setupHttpClient() {
  HttpsClient.setup();
}
