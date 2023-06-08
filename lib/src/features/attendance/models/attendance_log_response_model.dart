import 'package:beetlehr_sdk/src/models/models.dart';
import 'package:equatable/equatable.dart';

import 'attendance_model.dart';

/// Model class representing the response of attendance logs.
class AttendanceLogResponseModel extends Equatable {
  final List<AttendanceModel> data; // List of attendance logs
  final MetaData? meta; // Additional metadata

  const AttendanceLogResponseModel({
    required this.data,
    this.meta,
  });

  /// Creates an instance of [AttendanceLogResponseModel] from JSON data.
  factory AttendanceLogResponseModel.fromJson(Map<String, dynamic> json) =>
      AttendanceLogResponseModel(
        data: json['data'] != null
            ? List<AttendanceModel>.from(
                json["data"].map((x) => AttendanceModel.fromJson(x)))
            : [],
        meta: json['meta'] != null ? MetaData.fromJson(json["meta"]) : null,
      );

  /// Converts the [AttendanceLogResponseModel] instance to JSON.
  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };

  @override
  List<Object?> get props => [data, meta];

  @override
  bool get stringify => true;
}
