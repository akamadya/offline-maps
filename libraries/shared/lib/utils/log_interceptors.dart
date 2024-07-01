import 'dart:async';
import 'package:dio/dio.dart';

import 'package:shared/utils/utlis.dart';

class LogInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logW(
        'REQUEST[${options.method}] => PATH: ${options.path} ${options.queryParameters} ${options.data}');
    return super.onRequest(options, handler);
  }

  @override
  Future<dynamic> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (!response.requestOptions.path.contains('berita')) {
      logW(
          'RESPONSE[${response.statusCode}] => PATH: ${response.realUri.path} ${response.data}');
    }
    return super.onResponse(response, handler);
  }

  @override
  Future<dynamic> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    var message = 'ERROR[${err.response?.statusCode}] => PATH: ${err.response}';
    logE(message);
    return super.onError(err, handler);
  }
}
