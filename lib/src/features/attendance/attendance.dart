import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:beetlehr_sdk/src/features/attendance/models/models.dart';
import 'package:dio/dio.dart';

/// Class for handling attendance-related operations in BeetleHR.
class AttendanceBeetleHR {
  AttendanceBeetleHR(this.dio);

  final Dio dio; // Instance of Dio for making HTTP requests

  /// Retrieves the attendance overview for a specific date.
  ///
  /// The [date] parameter represents the date for which the attendance overview is to be retrieved.
  /// Returns a [Future] that resolves to an [AttendanceOverviewModel] containing the attendance overview.
  /// Throws a [ServerException] if an error occurs during the API request.
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

  /// Uploads the attendance image with the provided request body.
  ///
  /// The [body] parameter represents the request body containing the attendance image data.
  /// Returns a [Future] that resolves to an [AttendanceImageResponseModel] containing the uploaded image response.
  /// Throws a [ServerException] if an error occurs during the API request.
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
  /// The [month] and [year] parameters represent the month and year for which the attendance logs are to be retrieved.
  /// The [status] parameter is optional and represents the status of the attendance logs.
  /// Returns a [Future] that resolves to an [AttendanceLogResponseModel] containing the attendance logs.
  /// Throws a [ServerException] if an error occurs during the API request.
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

  /// Checks the branch office for attendance with the provided request body.
  ///
  /// The [body] parameter represents the request body containing the branch office location data.
  /// Returns a [Future] that resolves to an [AttendanceCheckBranchResponseModel] containing the branch office check response.
  /// Throws a [ServerException] if an error occurs during the API request.
  Future<AttendanceCheckBranchResponseModel> checkBranchOffice(
    AttendanceCheckBranchRequestModel body,
  ) async {
    try {
      final response = await dio.post(
        '/employee/attendance-check-location',
        data: body.toJson(),
      );
      return AttendanceCheckBranchResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toServerException();
    }
  }

  /// Retrieves the attendance details for a specific date.
  ///
  /// The [date] parameter represents the date for which the attendance details are to be retrieved.
  /// Returns a [Future] that resolves to an [AttendanceDetailResponseModel] containing the attendance details.
  /// Throws a [ServerException] if an error occurs during the API request.
  Future<AttendanceDetailResponseModel> getAttendanceDetail(String date) async {
    try {
      final response = await dio.get('/employee/attendance-detail/$date');
      return AttendanceDetailResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toServerException();
    }
  }

  /// Checks if clocking in/out is accepted for the provided clock body.
  ///
  /// The [body] parameter represents the clocking in/out details.
  /// Returns a [Future] that resolves to a [ClockAcceptResponseModel] containing the acceptance status.
  /// Throws a [ServerException] if an error occurs during the API request.
  Future<ClockAcceptResponseModel> checkAcceptClock(ClockBodyModel body) async {
    try {
      final response = await dio.post(
        '/employee/attendance-check-before-clock',
        data: body.toJsonNoFiles(),
      );
      return ClockAcceptResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toServerException();
    }
  }

  /// Clocks the attendance with the provided request [body].
  ///
  /// The [body] parameter represents the request body containing the attendance data.
  /// Returns a [Future] that resolves to an [AttendanceResponseModel] containing the response for the attendance clocking.
  /// Throws a [ServerException] if an error occurs during the API request.
  Future<AttendanceResponseModel> clockAttendance(
      Map<String, dynamic> body) async {
    try {
      final response = await dio.post('/employee/attendance-clock', data: body);
      return AttendanceResponseModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw e.toServerException();
    }
  }

  /// Retrieves the schedule for the specified [date].
  ///
  /// The [date] parameter represents the date for which the schedule is requested.
  /// Returns a [Future] that resolves to a [ScheduleResponseModel] containing the schedule data.
  /// Throws a [ServerException] if an error occurs during the API request.
  Future<ScheduleResponseModel> getSchedule(String date) async {
    try {
      final response = await dio.get('/employee/schedule', queryParameters: {
        'date': date,
      });
      return ScheduleResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toServerException();
    }
  }
}
