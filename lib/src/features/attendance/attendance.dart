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
      final response = await dio.post('/employee/attendance-image', data: body);
      return AttendanceImageResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toServerException();
    }
  }
}
