import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

// Dio dio = Dio();

class Diointerceptors {
  static Dio dio = Dio();
  static Future<Dio> init() async {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
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
