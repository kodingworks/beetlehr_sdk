import 'package:beetlehr_sdk/src/models/models.dart';
import 'package:equatable/equatable.dart';

import 'attendance_overview_data_model.dart';

/// Model class for attendance overview.
class AttendanceOverviewModel extends Equatable {
  final AttendanceOverviewDataModel data; // Attendance overview data
  final MetaData meta; // Additional metadata

  AttendanceOverviewModel({
    required this.data, // Attendance overview data (required)
    required this.meta, // Additional metadata (required)
  });

  /// Constructs an instance of [AttendanceOverviewModel] from a JSON object.
  factory AttendanceOverviewModel.fromJson(Map<String, dynamic> json) =>
      AttendanceOverviewModel(
        data: AttendanceOverviewDataModel.fromJson(json['data']),
        meta: MetaData.fromJson(json['meta']),
      );

  /// Converts this [AttendanceOverviewModel] instance to a JSON object.
  Map<String, dynamic> toJson() => {
        'data': data.toJson(),
        'meta': meta.toJson(),
      };

  @override
  List<Object> get props => [data, meta];
}
