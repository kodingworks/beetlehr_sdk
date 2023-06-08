import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:beetlehr_sdk/src/helpers/helpers.dart';
import 'package:beetlehr_sdk/src/models/models.dart';

import 'attendance_detail_model.dart';
import 'attendance_image_model.dart';

/// Model representing the response data for attendance.
///
/// This model extends the [AttendanceDetailModel] and adds additional properties
/// specific to the attendance response, such as [clockoutDuration], [clockToleranceDuration],
/// [trackerInterval], and [trackerConfig].
class AttendanceResponseModel extends AttendanceDetailModel {
  final Duration clockoutDuration;
  final Duration clockToleranceDuration;
  final Duration trackerInterval;
  final TrackerConfigModel trackerConfig;

  const AttendanceResponseModel({
    int? id,
    required String date,
    required String clock,
    String? clockGmt,
    required AttendanceClockType? type,
    AttendanceImageModel? image,
    required double latitude,
    required double longitude,
    String? address,
    String? notes,
    String? scheduleClock,
    String? scheduleClockGmt,
    bool? isLate,
    List<String>? files,
    required this.clockoutDuration,
    required this.clockToleranceDuration,
    required this.trackerInterval,
    required this.trackerConfig,
  }) : super(
          id: id,
          date: date,
          clock: clock,
          clockGmt: clockGmt,
          type: type,
          image: image,
          latitude: latitude,
          longitude: longitude,
          address: address,
          notes: notes,
          scheduleClock: scheduleClock,
          scheduleClockGmt: scheduleClockGmt,
          isLate: isLate,
          files: files,
        );

  factory AttendanceResponseModel.fromJson(Map<String, dynamic> json) {
    return AttendanceResponseModel(
      id: json["id"] ?? 0,
      date: json["date"],
      clock: json["clock"],
      clockGmt: json["clock_gmt"],
      type: attendanceClockTypeFromString(json['type']) ??
          AttendanceClockType.clockIn,
      image: json["image"] != null
          ? AttendanceImageModel.fromJson(json["image"])
          : null,
      latitude: double.parse('${json["latitude"] ?? 0}'),
      longitude: double.parse('${json["longitude"] ?? 0}'),
      address: json["address"],
      notes: json["notes"],
      scheduleClock: json["schedule_clock"],
      scheduleClockGmt: json["schedule_clock_gmt"],
      isLate: json["is_late"],
      files: json['files'] != null
          ? List<String>.from(json['files']).toList()
          : null,
      clockoutDuration: durationTimeParse(json['clockout_duration']) ??
          const Duration(seconds: 0),
      clockToleranceDuration:
          durationTimeParse(json['clockout_tolerance_duration']) ??
              const Duration(seconds: 0),
      trackerInterval: durationTimeParse(json['tracker_interval']) ??
          const Duration(minutes: 5),
      trackerConfig: TrackerConfigModel.fromJson(json['tracker_configuration']),
    );
  }
}
