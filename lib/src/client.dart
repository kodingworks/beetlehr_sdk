import 'package:beetlehr_sdk/src/extensions/dio_error_extension.dart';
import 'package:beetlehr_sdk/src/shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import 'features/features.dart';
import 'helpers/helpers.dart';
import 'models/models.dart';
import 'scheme.dart';

/// The BeetleHRClient class is responsible for handling HTTP requests to the Beetle HR API.
class BeetleHRClient {
  late Dio dio;
  late String baseUrl;
  late String language;
  late bool isLog;

  /// Creates a new instance of the BeetleHRClient class.
  ///
  /// The [baseUrl] parameter specifies the base URL of the Beetle HR API.
  /// The [isLog] parameter (optional) indicates whether request/response logging is enabled (default is false).
  /// The [language] parameter (optional) specifies the language for localization (default is 'id').
  BeetleHRClient(
    this.baseUrl, {
    this.isLog = false,
    this.language = 'id',
  }) {
    dio = Dio(BaseOptions(baseUrl: baseUrl))
      ..interceptors.addAll(
        [
          LogInterceptor(requestBody: isLog, responseBody: isLog),
          AuthHttpInterceptor(language: language),
        ],
      );
  }

  /// Retrieves the server status.
  ///
  /// The [schema] parameter (optional) specifies the URL schema to use (default is BaseUrlSchema.https).
  Future<CheckServerModel> getServerStatus({
    BaseUrlSchema schema = BaseUrlSchema.https,
  }) async {
    try {
      final response = await dio.get('/server/status', queryParameters: {
        'endpoint': baseUrl,
        'protocol': schema.toUrlSchema()
      });
      return CheckServerModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toServerException();
    }
  }

  /// Logs in with email and password.
  ///
  /// The [email] parameter specifies the user's email.
  /// The [password] parameter specifies the user's password.
  Future<AuthResponseModel> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post('/employee/authentication/login', data: {
        'email': email,
        'password': password,
      });

      final auth = AuthResponseModel.fromJson(response.data);

      saveToken(auth.token);

      return auth;
    } on DioException catch (e) {
      throw e.toServerException();
    }
  }

  /// Sends a password reset email.
  ///
  /// The [email] parameter specifies the user's email.
  Future<bool> resetPasswordEmail(String email) async {
    try {
      final dioWithOption = dio..options.headers['ignore_403'] = true;
      final response = await dioWithOption.post(
        '/employee/authentication/password/email',
        data: {'email': email},
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on DioException catch (e) {
      throw e.toServerException();
    }
  }

  /// ATTENDANCE
  AttendanceBeetleHR get attendance => AttendanceBeetleHR(dio);
}
