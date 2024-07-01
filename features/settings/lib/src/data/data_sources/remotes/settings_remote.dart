import 'package:auth/auth.dart';
import 'package:dio/dio.dart';

mixin RemoteSettings {
  Future<int> deleteAccount();
}

class RemoteSettingsImpl implements RemoteSettings {
  RemoteSettingsImpl(this.dio, this.localAuth);

  final Dio dio;
  final LocalAuth localAuth;

  Future<Map<String, String>> getHeaders() async {
    final user = await localAuth.getData();
    return {'Authorization': 'Bearer ${user.token}'};
  }

  @override
  Future<int> deleteAccount() async {
    dio.options.headers.addAll(await getHeaders());

    final user = await localAuth.getData();
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/setting/user/status',
      data: {
        'user_id': user.user.id,
        'status': 0,
      },
    );
    return response.data!['code'] as int;
  }
}
