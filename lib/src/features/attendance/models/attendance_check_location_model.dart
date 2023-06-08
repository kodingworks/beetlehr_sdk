import 'package:beetlehr_sdk/src/models/models.dart';
import 'package:equatable/equatable.dart';

import 'attendance_office_branch_model.dart';

/// Model class representing the response for checking the Branch of the office.
class AttendanceCheckBranchResponseModel extends Equatable {
  final AttendanceOfficeBranchModel data; // Office Branch data
  final MetaData? meta; // Additional metadata

  const AttendanceCheckBranchResponseModel({
    required this.data,
    this.meta,
  });

  /// Creates an instance of [AttendanceCheckBranchResponseModel] from JSON.
  factory AttendanceCheckBranchResponseModel.fromJson(
      Map<String, dynamic> json) {
    return AttendanceCheckBranchResponseModel(
      data: AttendanceOfficeBranchModel.fromJson(json["data"]),
      meta: json['meta'] != null ? MetaData.fromJson(json["meta"]) : null,
    );
  }

  /// Converts the [AttendanceCheckBranchResponseModel] instance to JSON.
  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "meta": meta?.toJson(),
      };

  @override
  List<Object?> get props => [data, meta];

  @override
  bool get stringify => true;
}
