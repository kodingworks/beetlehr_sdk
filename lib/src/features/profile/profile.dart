// ignore_for_file: deprecated_member_use

import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:dio/dio.dart';

import 'models/models.dart';

/// The `ProfileBeetleHR` class provides methods for interacting with the BeetleHR profile API.
class ProfileBeetleHR {
  /// Creates a new instance of the `ProfileBeetleHR` class.
  ///
  /// The [dio] parameter is required and represents the Dio instance for making HTTP requests.
  ProfileBeetleHR(this.dio);

  final Dio dio;

  /// Retrieves the user profile from the BeetleHR API.
  ///
  /// Returns a `Future` that resolves to a `ProfileResponseModel` containing the user profile data.
  /// Throws a `ServerException` if an error occurs during the API call.
  Future<ProfileResponseModel> get() async {
    try {
      final response = await dio.get('/employee/profile');

      return ProfileResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }

  /// Updates the user profile on the BeetleHR API.
  ///
  /// The [body] parameter represents the updated profile data to be sent in the request.
  /// Returns a `Future` that resolves to a `ProfileResponseModel` containing the updated user profile data.
  /// Throws a `ServerException` if an error occurs during the API call.
  Future<ProfileResponseModel> update(ProfileBodyModel body) async {
    try {
      final response = await dio.post(
        '/employee/profile/update',
        data: body.toFormData(),
      );

      return ProfileResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }
}
