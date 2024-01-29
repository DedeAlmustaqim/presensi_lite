import 'package:flutter/material.dart';
import 'package:presensi/core.dart';

// Dio dio = Dio();

class Diointerceptors {
  static Dio dio = Dio();
  static Future<Dio> init() async {
    dio.options = BaseOptions(
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppConfig.token}'
      },
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          print(options.uri);
          print(options.headers);
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          print("URL: ${response.realUri}");
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          const snackBar = SnackBar(
            content: Text('Bad Connection'),
          );
          ScaffoldMessenger.of(Get.currentContext).showSnackBar(snackBar);
          return handler.next(e);
        },
      ),
    );
    return dio;
  }
}
