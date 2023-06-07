import 'package:beetlehr_sdk/src/models/models.dart';
import 'package:equatable/equatable.dart';

import 'attendance_image_model.dart';

/// Model class for attendance image responses.
class AttendanceImageResponseModel extends Equatable {
  final AttendanceImageModel data; // The attendance image data
  final MetaData? meta; // Additional metadata (nullable)

  const AttendanceImageResponseModel({
    required this.data, // The attendance image data (required)
    this.meta, // Additional metadata (nullable)
  });

  /// Constructs an instance of [AttendanceImageResponseModel] from a JSON object.
  factory AttendanceImageResponseModel.fromJson(Map<String, dynamic> json) {
    return AttendanceImageResponseModel(
      meta: json['meta'] != null ? MetaData.fromJson(json['meta']) : null,
      data: AttendanceImageModel.fromJson(json['data']),
    );
  }

  /// Converts this [AttendanceImageResponseModel] instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'meta': meta?.toJson(),
    };
  }

  @override
  List<Object?> get props => [data, meta];

  @override
  bool get stringify => true;
}
