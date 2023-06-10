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

  /// Retrieves all approval requests based on the specified parameters.
  ///
  /// The [perPage] parameter specifies the number of approval requests to retrieve per page.
  /// The [page] parameter specifies the page number of the approval requests to retrieve.
  /// The [sortBy] parameter specifies the sorting order for the approval requests.
  /// The [requestType] parameter specifies the type of approval requests to retrieve.
  /// The [startTime] parameter specifies the start time of the approval requests to retrieve.
  /// The [endTime] parameter specifies the end time of the approval requests to retrieve.
  /// The [employee] parameter specifies the employee associated with the approval requests to retrieve.
  /// The [status] parameter specifies the status of the approval requests to retrieve.
  /// Returns a [Future] that resolves to an instance of [ApprovalRequestResponseModel] representing the retrieved approval requests.
  /// Throws a [ServerException] if an error occurs during the API request.
  Future<ApprovalRequestResponseModel> getAllApprovalRequest({
    required int perPage,
    required int page,
    required String sortBy,
    required String? requestType,
    required String? startTime,
    required String? endTime,
    required String? employee,
    required ApprovalRequestType? status,
  }) async {
    try {
      final response = await dio.get(
        '/employee/approvals',
        queryParameters: {
          'per_page': perPage,
          'page': page,
          'order_by': sortBy,
          'request_type': requestType,
          'start_time': startTime,
          'end_time': endTime,
          'employees': employee,
          'status': status?.convertToString(),
        },
      );
      return ApprovalRequestResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }

  /// Retrieves the approval request detail.
  ///
  /// The [id] parameter represents the ID of the approval request.
  /// The [type] parameter represents the type of the approval request.
  ///
  /// Returns a [Future] that resolves to an instance of [ApprovalRequestDetailResponseModel].
  /// Throws a [ServerException] if an error occurs during the API call.
  Future<ApprovalRequestDetailResponseModel> getApprovalRequestDetail(
      int id, String type) async {
    try {
      final response = await dio.get(
        '/employee/approvals/$id',
        queryParameters: {
          'type': type,
        },
      );
      return ApprovalRequestDetailResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }
}
