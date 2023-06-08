import 'package:beetlehr_sdk/src/models/models.dart';

import 'attendance_detail_model.dart';

/// The `AttendanceDetailResponseModel` class represents a response model for attendance details.
///
/// This model contains a list of `AttendanceDetailModel` instances, along with additional
/// information such as the total hours and metadata of the attendance data.
class AttendanceDetailResponseModel {
  /// The list of attendance detail models.
  final List<AttendanceDetailModel> data;

  /// The total hours of attendance.
  final String? totalHours;

  /// Additional metadata related to the attendance data.
  final MetaData? meta;

  /// Creates a new instance of the `AttendanceDetailResponseModel` class.
  ///
  /// The [data] parameter represents the list of attendance detail models.
  /// The [totalHours] parameter represents the total hours of attendance.
  /// The [meta] parameter represents additional metadata.
  AttendanceDetailResponseModel({
    required this.data,
    this.totalHours,
    this.meta,
  });

  /// Creates a new instance of the `AttendanceDetailResponseModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the attendance detail response.
  /// The keys in the JSON map are used to extract the corresponding values.
  factory AttendanceDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      AttendanceDetailResponseModel(
        data: json['data'] != null
            ? List<AttendanceDetailModel>.from(
                json['data'].map((x) => AttendanceDetailModel.fromJson(x)))
            : [],
        totalHours: json['total_hours'],
        meta: MetaData.fromJson(json['meta']),
      );

  /// Converts the `AttendanceDetailResponseModel` instance to a JSON map.
  ///
  /// Returns a JSON map representation of the `AttendanceDetailResponseModel` instance.
  Map<String, dynamic> toJson() => {
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
        'total_hours': totalHours,
        'meta': meta?.toJson(),
      };
}
