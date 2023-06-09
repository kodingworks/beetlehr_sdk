// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:beetlehr_sdk/src/exceptions/exceptions.dart';
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
    } on DioError catch (e) {
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
    } on DioError catch (e) {
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
    } on DioError catch (e) {
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
    } on DioError catch (e) {
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
    } on DioError catch (e) {
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
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }

  /// Clocks the attendance with the provided request [body].
  ///
  /// The [body] parameter represents the request body containing the attendance data.
  /// Returns a [Future] that resolves to an [AttendanceResponseModel] containing the response for the attendance clocking.
  /// Throws a [ServerException] if an error occurs during the API request.
  Future<AttendanceResponseModel> clockAttendance(ClockBodyModel body) async {
    try {
      final response = await dio.post(
        '/employee/attendance-clock',
        data: body.toJson(),
      );
      return AttendanceResponseModel.fromJson(response.data['data']);
    } on DioError catch (e) {
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
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }

  /// Checks and accepts clock attendance based on the provided [body].
  ///
  /// Returns a Future<bool> indicating whether the clock attendance was accepted or not.
  /// Throws a DefaultApiException if the clock attendance was not accepted.
  Future<bool> checkAcceptClockAttendance(
      CheckAcceptClockBodyModel body) async {
    try {
      final response = await dio.post(
        '/employee/attendance-check-clocked',
        data: body.toJson(),
      );
      if (response.data['data']['accepted'] != null &&
          response.data['data']['accepted'] == true) {
        return true;
      } else {
        throw DefaultApiException(message: response.data['data']['message']);
      }
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }

  /// Retrieves the schedule log for the given [startDate] and [endDate].
  ///
  /// Returns a Future<ScheduleResponseModel> containing the schedule log.
  /// Throws a ServerException if an error occurs.
  Future<ScheduleResponseModel> getScheduleLog(
      String startDate, String endDate) async {
    try {
      final response = await dio.get(
        '/employee/schedule',
        queryParameters: {
          'date': startDate,
          'endDate': endDate,
          'per_page': 31,
        },
      );
      return ScheduleResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }

  /// Retrieves the clock button type.
  ///
  /// Returns a Future<ClockButtonModel> containing the clock button type.
  /// Throws a ServerException if an error occurs.
  Future<ClockButtonModel> getClockButtonType() async {
    try {
      final response = await dio.post('/employee/check-button-clockin');
      return ClockButtonModel.fromJson(response.data['data']);
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }

  /// Synchronizes the provided [data] of offline attendances.
  ///
  /// Returns a Future<bool> indicating whether the attendances were synchronized successfully or not.
  /// Throws a ServerException if an error occurs.
  Future<bool> syncAttendances(List<AttendanceOfflineEntity> data) async {
    try {
      final response = await dio.post(
        '/employee/attendances/offline',
        data: data.map((e) => e.toJson()).toList(),
      );
      return response.statusCode == 200;
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }

  /// Uploads attendance images to the server.
  ///
  /// Takes a list of [files] as input and returns a [Future] that resolves
  /// to an [UploadFilesResponseModel] representing the response from the server.
  /// Throws a [ServerException] if an error occurs during the upload process.
  Future<UploadFilesResponseModel> uploadAttendanceImages(
      List<File> files) async {
    try {
      final response = await dio.post(
        '/employee/offline/files',
        data: files.toFormData(),
      );

      return UploadFilesResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }

  /// Cancels the attendance.
  ///
  /// Returns a [Future] that resolves to a boolean value indicating
  /// whether the attendance cancellation was successful or not.
  /// Throws a [ServerException] if an error occurs during the cancellation process.
  Future<bool> cancelAttendance() async {
    try {
      final response =
          await dio.post('/employee/attendances/cancel-attendance');

      return response.statusCode == 200;
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }

  /// Initiates a break time for the employee.
  ///
  /// Takes a [body] of type [BreakTimeBodyModel] as input and returns
  /// a [Future] that resolves to a [BreakTimeResponseModel] representing
  /// the response from the server. Throws a [ServerException] if an error
  /// occurs during the break time initiation process.
  Future<BreakTimeResponseModel> breakTime(BreakTimeBodyModel body) async {
    try {
      final response =
          await dio.post('/employee/attendance/break', data: body.toJson());
      return BreakTimeResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }

  /// Checks the break time setting for the employee.
  ///
  /// Returns a [Future] that resolves to a boolean value indicating
  /// whether the break time page can be closed or not.
  /// Throws a [ServerException] if an error occurs during the check process.
  Future<bool> checkBreakTimeSetting() async {
    try {
      final response = await dio.get('/employee/attendance/break-setting');
      return response.data['data']['is_can_close_page'] == true;
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }
}
