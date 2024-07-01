import 'dart:developer';
import 'dart:io';

import 'package:auth/auth.dart';
import 'package:dio/dio.dart';
import 'package:shared/utils/app_notification.dart';
import 'package:shared/utils/log_debug_console.dart';

mixin RemoteAuth {
  Future<LoginDataModel> signIn(ParamsRequestLogin requestData);
  Future<bool> logOut();
}

class RemoteAuthImpl implements RemoteAuth {
  RemoteAuthImpl(this.dio, this.localAuth);

  final Dio dio;
  final LocalAuth localAuth;

  Future<Map<String, String>> getHeaders() async {
    final user = await localAuth.getData();
    return {'Authorization': 'Bearer ${user.token}'};
  }

  @override
  Future<LoginDataModel> signIn(ParamsRequestLogin requestData) async {
    final response = await dio.post<Map<String, dynamic>>(
      requestData.isSso ? '/v1/auth/login/sso' : '/v1/auth/login',
      data: requestData.toJson(),
    );

    final result =
        LoginDataModel.fromJson(response.data!['data'] as Map<String, dynamic>);

    await sendFcm(result.token);

    return result;
  }

  @override
  Future<bool> logOut() async {
    dio.options.headers.addAll(await getHeaders());
    final response = await dio.post<Map<String, dynamic>>('/v1/auth/logout');
    return true;
  }

  //@override
  Future<bool> sendFcm(String tokenAuth) async {
    logI('token Auth = $tokenAuth');
    dio.options.headers.addAll({'Authorization': 'Bearer $tokenAuth'});
    final tokenFcm = await AppNotification.getDeviceToken();
    log('token FCM = $tokenFcm');
    await dio.post<Map<String, dynamic>>(
      '/v1/auth/store-fcm-token',
      data: {'fcm_token': tokenFcm},
    );
    return true;
  }
}
