import 'package:beetlehr_sdk/src/exceptions/exceptions.dart';
import 'package:dio/dio.dart';

/// Error handling when error in interceptor about authentication
class AuthHttpInterceptor extends InterceptorsWrapper {
  /// Repository to get data current token
  final String token;
  final String deviceId;
  final String language;

  ///
  AuthHttpInterceptor({
    required this.deviceId,
    required this.token,
    required this.language,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final optionHeaders = <String, Object>{};

    if (options.headers['unAuthorize'] != true) {
      optionHeaders.putIfAbsent('Authorization', () => 'Bearer $token');
    }
    optionHeaders.putIfAbsent('user-device', () => deviceId);

    optionHeaders.putIfAbsent('Accept-Language', () => language);

    options.headers.addAll(optionHeaders);
    handler.next(options);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    final isError403 = (err.response?.statusCode == 403 &&
        err.requestOptions.headers['ignore_403'] != true);

    final isError401 = (err.response?.statusCode == 401 &&
        err.requestOptions.headers['ignore_401'] != true);

    if (isError401 || isError403) {
      throw UnAuthenticationServerException(message: 'Unauhentication');
    }
    handler.next(err);
  }
}
