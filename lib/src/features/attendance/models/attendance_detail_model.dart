import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:equatable/equatable.dart';

import 'attendance_image_model.dart';

/// The `AttendanceDetailModel` class represents a model for attendance details.
///
/// This model contains information about a specific attendance entry, including ID, date,
/// clock time, clock GMT, attendance type, image, geographical location (latitude and longitude),
/// address, notes, schedule clock, schedule clock GMT, late status, and associated files.
class AttendanceDetailModel extends Equatable {
  /// The unique identifier of the attendance entry.
  final int? id;

  /// The date of the attendance entry.
  final String date;

  /// The clock time of the attendance entry.
  final String clock;

  /// The GMT time of the attendance clock.
  final String? clockGmt;

  /// The type of attendance clock (e.g., clock-in, clock-out).
  final AttendanceClockType? type;

  /// The image associated with the attendance entry.
  final AttendanceImageModel? image;

  /// The latitude of the geographical location where the attendance was recorded.
  final double latitude;

  /// The longitude of the geographical location where the attendance was recorded.
  final double longitude;

  /// The address corresponding to the geographical location where the attendance was recorded.
  final String? address;

  /// Additional notes or comments about the attendance entry.
  final String? notes;

  /// The scheduled clock time for the attendance entry.
  final String? scheduleClock;

  /// The GMT time of the scheduled clock.
  final String? scheduleClockGmt;

  /// Indicates whether the attendance entry is marked as late.
  final bool? isLate;

  /// A list of file URLs associated with the attendance entry.
  final List<String>? files;

  /// Creates a new instance of the `AttendanceDetailModel` class.
  ///
  /// The [id], [date], [clock], [latitude], and [longitude] parameters are required.
  /// Other parameters are optional and represent additional details of the attendance entry.
  const AttendanceDetailModel({
    this.id,
    required this.date,
    required this.clock,
    this.clockGmt,
    this.type,
    this.image,
    required this.latitude,
    required this.longitude,
    this.address,
    this.notes,
    this.scheduleClock,
    this.scheduleClockGmt,
    this.isLate,
    this.files,
  });

  /// Creates a new instance of the `AttendanceDetailModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the attendance details.
  /// The keys in the JSON map are used to extract the corresponding values.
  factory AttendanceDetailModel.fromJson(Map<String, dynamic> json) {
    return AttendanceDetailModel(
      id: json['id'] ?? 0,
      date: json['date'],
      clock: json['clock'],
      clockGmt: json['clock_gmt'],
      type: attendanceClockTypeFromString(json['type']) ??
          AttendanceClockType.clockIn,
      image: json['image'] != null
          ? AttendanceImageModel.fromJson(json['image'])
          : null,
      latitude: double.parse('${json['latitude'] ?? 0}'),
      longitude: double.parse('${json['longitude'] ?? 0}'),
      address: json['address'],
      notes: json['notes'],
      scheduleClock: json['schedule_clock'],
      scheduleClockGmt: json['schedule_clock_gmt'],
      isLate: json['is_late'],
      files: json['files'] != null
          ? List<String>.from(json['files']).toList()
          : null,
    );
  }

  /// Converts the `AttendanceDetailModel` instance to a JSON map.
  ///
  /// Returns a JSON map representation of the `AttendanceDetailModel` instance.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'clock': clock,
      'clock_gmt': clockGmt,
      'type': type?.convertToString(),
      'image': image?.toJson(),
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'notes': notes,
      'schedule_clock': scheduleClock,
      'schedule_clock_gmt': scheduleClockGmt,
      'is_late': isLate,
      'files': files,
    };
  }

  @override
  List<Object?> get props => [
        id,
        date,
        clock,
        clockGmt,
        type,
        image,
        latitude,
        longitude,
        address,
        notes,
        scheduleClock,
        scheduleClockGmt,
        isLate,
        files,
      ];
}
