// coverage:ignore-file

import 'package:core/core.dart';
import 'package:dio/dio.dart';

extension DioErrorExtension on DioException {
  ServerException toServerException() {
    switch (type) {
      case DioExceptionType.badResponse:
        switch (response?.statusCode) {
          case 400:
            return GeneralServerException(
              message: _buildErrorMessage(response, message ?? ''),
              code: response?.statusCode,
            );
          case 401:
            return UnAuthenticationServerException(
              message: _buildErrorMessage(response, message ?? ''),
              code: response?.statusCode,
            );
          case 403:
            return UnAuthorizeServerException(
              message: _buildErrorMessage(response, message ?? ''),
              code: response?.statusCode,
            );
          case 404:
            return NotFoundServerException(
              message: _buildErrorMessage(response, message ?? ''),
              code: response?.statusCode,
            );
          case 500:
          case 502:
            return InternalServerException(
              message: _buildErrorMessage(
                response,
                'Ups server sedang penuh, coba ulangi sesaat lagi!',
              ),
              code: response?.statusCode,
            );
          default:
            return GeneralServerException(
              message: _buildErrorMessage(response, message ?? ''),
              code: response?.statusCode,
            );
        }

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeOutServerException(
          message: _buildErrorMessage(response, message ?? ''),
          code: response?.statusCode,
        );

      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
        return GeneralServerException(
          message: _buildErrorMessage(response, message ?? ''),
          code: response?.statusCode,
        );
      case DioExceptionType.badCertificate:
        return TimeOutServerException(
          message: _buildErrorMessage(response, message ?? ''),
          code: response?.statusCode,
        );

      case DioExceptionType.connectionError:
        return TimeOutServerException(
          message: _buildErrorMessage(response, message ?? ''),
          code: response?.statusCode,
        );
    }
  }
}

String _buildErrorMessage(Response<dynamic>? response, String message) {
  try {
    final res = response!.data! as Map<String, dynamic>;
    return res['user_message'] as String;
  } catch (err) {
    if (message.contains('SocketException') ||
        message.contains('HandshakeException')) {
      return 'socket';
    }
    return message;
  }
}
