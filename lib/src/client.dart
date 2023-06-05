import 'package:dio/dio.dart';

import 'helpers/helpers.dart';

/// BeetleHRClient is a client for interacting with the BeetleHR API.
///
/// The client requires a [baseUrl] which represents the base URL of the API
/// and an optional [isLog] flag to enable or disable logging.
///
/// The [dio] object is used for making HTTP requests to the API. It is lazily
/// initialized with the provided [baseUrl] and a [LogInterceptor] if logging is enabled.
///
/// Example usage:
/// ```dart
/// final client = BeetleHRClient('https://api.beetlehr.com', isLog: true);
/// ```
class BeetleHRClient {
  late Dio dio;
  late String baseUrl;
  late String token;
  late String language;
  late String deviceId;
  late bool isLog;

  BeetleHRClient(
    this.baseUrl, {
    this.isLog = false,
    required this.deviceId,
    required this.token,
    this.language = 'id',
  }) {
    dio = Dio(BaseOptions(baseUrl: baseUrl))
      ..interceptors.addAll(
        [
          LogInterceptor(requestBody: isLog, responseBody: isLog),
          AuthHttpInterceptor(
            deviceId: deviceId,
            language: language,
            token: token,
          ),
        ],
      );
  }
}
