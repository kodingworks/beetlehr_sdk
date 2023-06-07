import 'package:beetlehr_sdk/src/models/models.dart';
import 'package:equatable/equatable.dart';

import 'attendance_office_placement_model.dart';

/// Model class representing the response for checking the placement of the office.
class AttendanceCheckPlacementResponseModel extends Equatable {
  final AttendanceOfficePlacementModel data; // Office placement data
  final MetaData? meta; // Additional metadata

  const AttendanceCheckPlacementResponseModel({
    required this.data,
    this.meta,
  });

  /// Creates an instance of [AttendanceCheckPlacementResponseModel] from JSON.
  factory AttendanceCheckPlacementResponseModel.fromJson(
      Map<String, dynamic> json) {
    return AttendanceCheckPlacementResponseModel(
      data: AttendanceOfficePlacementModel.fromJson(json["data"]),
      meta: json['meta'] != null ? MetaData.fromJson(json["meta"]) : null,
    );
  }

  /// Converts the [AttendanceCheckPlacementResponseModel] instance to JSON.
  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "meta": meta?.toJson(),
      };

  @override
  List<Object?> get props => [data, meta];

  @override
  bool get stringify => true;
}
