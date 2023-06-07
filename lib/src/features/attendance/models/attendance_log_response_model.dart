import 'package:beetlehr_sdk/src/models/models.dart';
import 'package:equatable/equatable.dart';

import 'attendance_model.dart';

class AttendanceLogResponseModel extends Equatable {
  final List<AttendanceModel> data;
  final MetaData? meta;
  const AttendanceLogResponseModel({
    required this.data,
    this.meta,
  });

  factory AttendanceLogResponseModel.fromJson(Map<String, dynamic> json) =>
      AttendanceLogResponseModel(
        data: json['data'] != null
            ? List<AttendanceModel>.from(
                json["data"].map((x) => AttendanceModel.fromJson(x)))
            : [],
        meta: json['meta'] != null ? MetaData.fromJson(json["meta"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };

  @override
  List<Object?> get props => [data, meta];

  @override
  bool get stringify => true;
}
