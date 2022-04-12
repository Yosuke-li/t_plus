import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:transaction_plus/global/api.dart';
import 'package:transaction_plus/global/global.dart';
import 'package:transaction_plus/utils/api_exception.dart';
import 'package:transaction_plus/utils/log_utils.dart';

import '../store.dart';
import 'dio_helper.dart';

typedef void ChildBuildContext(BuildContext context);

class DioInterceptor extends Interceptor {
  late ChildBuildContext context;

  @override
  Future<Response?> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response != null && err.response!.statusCode == 401) {
      Log.info('dio onError: ');
      Dio dio = Dio();
      dio.lock();
      String? accessToken = await getToken();
      dio.unlock();
      //重新发起一个请求获取数据
      Dio tokenDio2 = new Dio(); //创建新的dio实例
      tokenDio2.options.headers['Authorization'] = 'Bearer ' + accessToken!;
      tokenDio2.options.baseUrl = Request.baseUrl;
      try {
        final newRequest = await tokenDio2.request(err.requestOptions.path,
            data: err.requestOptions.data);
        return newRequest;
      } on DioError catch (e) {
        rethrow;
      }
    }
    super.onError(err, handler);
  }

  Future<String?> getToken() async {
    try {
      String refreshToken = Global.user!.refreshToken!; //获取当前的refreshToken
      String? accessToken;

      Dio tokenDio = new Dio(); //创建新Dio实例
      tokenDio.options.baseUrl = Request.baseUrl;
      tokenDio.options.headers['Authorization'] =
          'Bearer ' + refreshToken;

      try {
        var response =
            await tokenDio.get(ApiCenter.refreshToken); //请求refreshToken刷新的接口
        Global.user?.accessToken = response.data['access_token']; //新的accessToken
        Global.user?.refreshToken =
            response.data['refresh_token']; //新的refreshToken
        accessToken = response.data['access_token'];

        LocateStorage.setStringWithExpire(
            'User', jsonEncode(Global.user), Duration(days: 7));
        Log.info('Global.user.accessToken: ${Global.user?.accessToken}');
      } on DioError catch (e) {
        if (e.response?.statusCode == 401) {
          //401代表refresh_token过期
          throw ApiException(401, 'Token已过期');
        }
      }
      return accessToken;
    } catch (error, stack) {
      Log.error(error, stackTrace: stack);
      rethrow;
    }
  }
}
