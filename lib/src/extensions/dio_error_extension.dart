// ignore_for_file: deprecated_member_use

import 'package:beetlehr_sdk/src/exceptions/exceptions.dart';
import 'package:beetlehr_sdk/src/models/models.dart';
import 'package:dio/dio.dart';

/// The `DioErrorExtension` extension provides a convenient method to convert `DioError` instances to `ServerException`.
extension DioErrorExtension on DioError {
  /// Converts the `DioError` instance to a `ServerException` instance.
  ///
  /// This method analyzes the type and status code of the `DioError` to determine the appropriate `ServerException` to return.
  /// If the response contains a 'meta' field, it tries to extract the error message from it.
  ///
  /// Returns the corresponding `ServerException` instance based on the error type and status code.
  ServerException toServerException() {
    final meta = response?.data != null
        ? ErrorMetaData.fromJson(response?.data['meta'] ?? {})
        : null;
    switch (type) {
      case DioErrorType.badResponse:
        switch (response?.statusCode) {
          case 401:
            return UnAuthenticationServerException(
              message: meta?.error ?? 'Unauthorized',
              code: response?.statusCode,
            );
          case 403:
            return UnAuthorizeServerException(
              message: meta?.error ?? 'Forbidden',
              code: response?.statusCode,
            );
          case 404:
            return NotFoundServerException(
              message: meta?.error ?? 'Not found',
              code: response?.statusCode,
            );
          case 500:
          case 502:
            return InternalServerException(
              message: meta?.error ?? 'Internal server error',
              code: response?.statusCode,
            );
          default:
            return GeneralServerException(
              message: meta?.error ?? 'Internal server error',
              code: response?.statusCode,
            );
        }

      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return TimeOutServerException(
          message: meta?.error ?? 'Connection timeout',
          code: response?.statusCode,
        );

      case DioErrorType.cancel:
      case DioErrorType.badCertificate:
      case DioErrorType.connectionError:
      case DioErrorType.unknown:
        return GeneralServerException(
          message: meta?.error ?? 'A Server Error Occurred',
          code: response?.statusCode,
        );
    }
  }
}
