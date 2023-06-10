// ignore_for_file: deprecated_member_use

import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:dio/dio.dart';

import 'models/models.dart';

/// The `NoticeBeetleHR` class provides methods to interact with the BeetleHR notice board API.
class NoticeBeetleHR {
  /// Creates a new instance of the `NoticeBeetleHR` class.
  ///
  /// The [dio] parameter is an instance of Dio used for making API requests.
  NoticeBeetleHR(this.dio);

  /// The Dio client used for making API requests.
  final Dio dio;

  /// Retrieves the notice board data from the BeetleHR API.
  ///
  /// The [page] parameter represents the page number of the notice board data to retrieve.
  /// The [perPage] parameter represents the number of notices per page.
  ///
  /// Returns a future that resolves to a `NoticeBoardResponseModel` representing the notice board data.
  ///
  /// Throws a `ServerException` if an error occurs during the API request.
  Future<NoticeBoardResponseModel> getBoard({
    required int page,
    required int perPage,
  }) async {
    try {
      final response = await dio.get(
        '/employee/notice-board',
        queryParameters: {'page': page, 'per_page': perPage},
      );
      return NoticeBoardResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }
}
