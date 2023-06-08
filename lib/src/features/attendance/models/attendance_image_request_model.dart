import 'dart:io';

import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

/// Model class for attendance image requests.
class AttendanceImageRequestModel extends Equatable {
  final File image; // The image file
  final AttendanceClockType type; // The attendance clock type
  final DateTime date; // The date of the attendance
  final WorkingFromType workingFrom; // The working from type

  const AttendanceImageRequestModel({
    required this.image, // The image file (required)
    required this.type, // The attendance clock type (required)
    required this.date, // The date of the attendance (required)
    required this.workingFrom, // The working from type (required)
  });

  /// Converts this [AttendanceImageRequestModel] instance to a [FormData] object.
  Future<FormData> toJson() async {
    return FormData.fromMap({
      'image': await MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      ),
      'type': type.convertToString(),
      'date': date.toIso8601String(),
      'status': workingFrom.convertToString(),
    });
  }

  @override
  List<Object> get props => [image, type, date, workingFrom];

  @override
  bool get stringify => true;
}
