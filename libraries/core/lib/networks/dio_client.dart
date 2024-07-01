// ignore_for_file: depend_on_referenced_packages

import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:shared/shared.dart';

class DioClient {

  DioClient(this.dio) {
    client = dio;
    client
      ..options = BaseOptions(
        baseUrl: AppConfig.baseUrl.value,
      )
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      )
      ..interceptors.add(
        RetryInterceptor(
          dio: dio,
          retries: dioRetryCount,
          logPrint: (message) =>
              AppLogger(appName: 'DioRetryInterceptor').print(message),
        ),
      );
  }
  final Dio dio;

  late Dio client;
}
