import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:equatable/equatable.dart';

/// Model class representing attendance data.
class AttendanceModel extends Equatable {
  const AttendanceModel({
    required this.date,
    required this.clockIn,
    this.clockInGmt,
    required this.clockOut,
    this.clockOutGmt,
    this.workHours,
    this.isForceClockOut,
    this.type,
    this.status,
  });

  final DateTime date; // The date of the attendance
  final String? clockIn; // The clock-in time
  final String? clockInGmt; // The clock-in time in GMT
  final String? clockOut; // The clock-out time
  final String? clockOutGmt; // The clock-out time in GMT
  final String? workHours; // The total work hours
  final bool? isForceClockOut; // Flag indicating if clock-out is forced
  final AttendanceType? type; // The attendance type
  final AttendanceLogType? status; // The attendance status

  /// Creates an instance of [AttendanceModel] from JSON data.
  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      AttendanceModel(
        date: DateTime.parse(json["date"]).toLocal(),
        clockIn: json["clock_in"],
        clockInGmt: json["clock_in_gmt"],
        clockOut: json["clock_out"],
        clockOutGmt: json["clock_out_gmt"],
        workHours: json["work_hours"],
        isForceClockOut: json["is_force_clock_out"],
        type: attendanceTypefromString(json["type"]),
        status: attendanceLogTypeFromString(json["status"]),
      );

  /// Converts the [AttendanceModel] instance to JSON.
  Map<String, dynamic> toJson() {
    return {
      "date": date.toIso8601String(),
      "clock_in": clockIn,
      "clock_in_gmt": clockInGmt,
      "clock_out": clockOut,
      "clock_out_gmt": clockOutGmt,
      "work_hours": workHours,
      "is_force_clock_out": isForceClockOut,
      "type": type?.convertToString(),
      "status": status,
    };
  }

  @override
  List<Object?> get props => [
        date,
        clockIn,
        clockInGmt,
        clockOut,
        clockOutGmt,
        workHours,
        isForceClockOut,
        type,
        status,
      ];
}
