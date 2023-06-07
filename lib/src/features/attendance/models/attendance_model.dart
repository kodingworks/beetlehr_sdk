import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:equatable/equatable.dart';

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

  final DateTime date;
  final String? clockIn;
  final String? clockInGmt;
  final String? clockOut;
  final String? clockOutGmt;
  final String? workHours;
  final bool? isForceClockOut;
  final AttendanceType? type;
  final AttendanceLogType? status;

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
