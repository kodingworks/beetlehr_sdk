import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:beetlehr_sdk/src/features/attendance/models/models.dart';
import 'package:dio/dio.dart';

/// Class for handling attendance-related operations in BeetleHR.
class AttendanceBeetleHR {
  AttendanceBeetleHR(this.dio);

  final Dio dio; // Instance of Dio for making HTTP requests

  /// Retrieves the attendance overview for a specific date.
  ///
  /// Returns an instance of [AttendanceOverviewModel] representing the attendance overview.
  Future<AttendanceOverviewModel> getAttendanceOverview(String date) async {
    try {
      final response = await dio.get(
        '/employee/attendance-overview',
        queryParameters: {'date': date},
      );
      return AttendanceOverviewModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toServerException();
    }
  }

  /// Uploads an attendance image.
  ///
  /// Returns an instance of [AttendanceImageResponseModel] representing the uploaded image response.
  Future<AttendanceImageResponseModel> uploadAttendanceImage(
    AttendanceImageRequestModel body,
  ) async {
    try {
      final response = await dio.post(
        '/employee/attendance-image',
        data: body.toJson(),
      );
      return AttendanceImageResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toServerException();
    }
  }

  /// Retrieves the attendance logs for a specific month and year.
  ///
  /// Returns an instance of [AttendanceLogResponseModel] representing the attendance logs.
  Future<AttendanceLogResponseModel> getAttendanceLogs(
    int month,
    int year, {
    String? status,
  }) async {
    try {
      final response =
          await dio.get('/employee/attendance-log', queryParameters: {
        'month': month,
        'year': year,
        'status': status ?? '',
      });
      return AttendanceLogResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toServerException();
    }
  }

  /// Checks the placement office for attendance.
  ///
  /// Returns an instance of [AttendanceCheckPlacementResponseModel] representing the check placement office response.
  Future<AttendanceCheckPlacementResponseModel> checkPlacementOffice(
    AttendanceCheckPlacementRequestModel body,
  ) async {
    try {
      final response = await dio.post(
        '/employee/attendance-check-location',
        data: body.toJson(),
      );
      return AttendanceCheckPlacementResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toServerException();
    }
  }
}
