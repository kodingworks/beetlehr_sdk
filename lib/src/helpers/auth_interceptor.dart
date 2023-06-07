import 'dart:io';

import 'package:beetlehr_sdk/src/shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';

/// Error handling when error in interceptor about authentication
class AuthHttpInterceptor extends InterceptorsWrapper {
  /// Repository to get data current token
  final String language;

  ///
  AuthHttpInterceptor({
    required this.language,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final optionHeaders = <String, Object>{};

    final token = await getToken();

    if (options.headers['unAuthorize'] != true) {
      optionHeaders.putIfAbsent('Authorization', () => 'Bearer $token');
    }

    late String? deviceId;

    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor;
    }

    optionHeaders.putIfAbsent('user-device', () => deviceId!);

    optionHeaders.putIfAbsent('Accept-Language', () => language);

    options.headers.addAll(optionHeaders);
    handler.next(options);
  }
}
