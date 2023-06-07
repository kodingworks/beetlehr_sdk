import 'package:beetlehr_sdk/src/models/models.dart';
import 'package:equatable/equatable.dart';

import 'attendance_office_placement_model.dart';

class AttendanceCheckPlacementResponseModel extends Equatable {
  final AttendanceOfficePlacementModel data;
  final MetaData? meta;

  const AttendanceCheckPlacementResponseModel({
    required this.data,
    this.meta,
  });

  factory AttendanceCheckPlacementResponseModel.fromJson(
          Map<String, dynamic> json) =>
      AttendanceCheckPlacementResponseModel(
        data: AttendanceOfficePlacementModel.fromJson(json["data"]),
        meta: json['meta'] != null ? MetaData.fromJson(json["meta"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "meta": meta?.toJson(),
      };

  @override
  List<Object?> get props => [data, meta];

  @override
  bool get stringify => true;
}
