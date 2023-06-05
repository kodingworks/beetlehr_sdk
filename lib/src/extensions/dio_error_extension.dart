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
    final meta = response?.data is Map && response?.data['meta'] is Map
        ? MetaData.fromJson(response?.data['meta'] ?? {})
        : null;
    switch (type) {
      case DioErrorType.badResponse:
        switch (response?.statusCode) {
          case 401:
            return UnAuthenticationServerException(
              message: meta?.message ?? 'Unauthorized',
              code: response?.statusCode,
            );
          case 403:
            return UnAuthorizeServerException(
              message: meta?.message ?? 'Forbidden',
              code: response?.statusCode,
            );
          case 404:
            return NotFoundServerException(
              message: meta?.message ?? 'Not found',
              code: response?.statusCode,
            );
          case 500:
          case 502:
            return InternalServerException(
              message: meta?.message ?? 'Internal server error',
              code: response?.statusCode,
            );
          default:
            return GeneralServerException(
              message: meta?.message ?? 'Internal server error',
              code: response?.statusCode,
            );
        }

      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return TimeOutServerException(
          message: meta?.message ?? 'Connection timeout',
          code: response?.statusCode,
        );

      case DioErrorType.cancel:
      case DioErrorType.badCertificate:
      case DioErrorType.connectionError:
      case DioErrorType.unknown:
        return GeneralServerException(
          message: meta?.message ?? 'A Server Error Occurred',
          code: response?.statusCode,
        );
    }
  }
}
