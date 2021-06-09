import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

typedef void ChildBuildContext(BuildContext context);

class DioInterceptor extends Interceptor {
  ChildBuildContext context;

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response != null && err.response.statusCode == 401) {
      Dio dio = Dio();
      dio.lock();
      String getNewToken = await getToken();

      dio.unlock();
    }
    super.onError(err, handler);
  }

  Future<String> getToken() async {

  }
}