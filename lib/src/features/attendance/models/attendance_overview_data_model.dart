import 'package:equatable/equatable.dart';

/// Model class for attendance overview data.
class AttendanceOverviewDataModel extends Equatable {
  final int present; // Number of times present
  final int ontime; // Number of times on time
  final int clockoutEarly; // Number of times clocked out early
  final int late; // Number of times late
  final int absent; // Number of times absent
  final int holiday; // Number of times on holiday
  final String totalWorkHours; // Total work hours
  final String totalLateHours; // Total late hours
  final String totalEarlyHours; // Total early hours
  final String totalAbsentHours; // Total absent hours
  final int totalLeaves; // Total number of leaves
  final int totalRemainingLeaves; // Total remaining leaves

  AttendanceOverviewDataModel({
    required this.present, // Number of times present (required)
    required this.ontime, // Number of times on time (required)
    required this.clockoutEarly, // Number of times clocked out early (required)
    required this.late, // Number of times late (required)
    required this.absent, // Number of times absent (required)
    required this.holiday, // Number of times on holiday (required)
    required this.totalWorkHours, // Total work hours (required)
    required this.totalLateHours, // Total late hours (required)
    required this.totalEarlyHours, // Total early hours (required)
    required this.totalAbsentHours, // Total absent hours (required)
    required this.totalLeaves, // Total number of leaves (required)
    required this.totalRemainingLeaves, // Total remaining leaves (required)
  });

  /// Constructs an instance of [AttendanceOverviewDataModel] from a JSON object.
  factory AttendanceOverviewDataModel.fromJson(Map<String, dynamic> json) =>
      AttendanceOverviewDataModel(
        present: json['present'],
        ontime: json['ontime'],
        clockoutEarly: json['clockout_early'],
        late: json['late'],
        absent: json['absent'],
        holiday: json['holiday'],
        totalWorkHours: json['total_work_hours'],
        totalLateHours: json['total_late_hours'],
        totalEarlyHours: json['total_early_hours'],
        totalAbsentHours: json['total_absent_hours'],
        totalLeaves: json['total_leaves'],
        totalRemainingLeaves: json['total_remaining_leaves'],
      );

  /// Converts this [AttendanceOverviewDataModel] instance to a JSON object.
  Map<String, dynamic> toJson() => {
        'present': present,
        'ontime': ontime,
        'clockout_early': clockoutEarly,
        'late': late,
        'absent': absent,
        'holiday': holiday,
        'total_work_hours': totalWorkHours,
        'total_late_hours': totalLateHours,
        'total_early_hours': totalEarlyHours,
        'total_absent_hours': totalAbsentHours,
        'total_leaves': totalLeaves,
        'total_remaining_leaves': totalRemainingLeaves,
      };

  @override
  List<Object?> get props => [
        present,
        ontime,
        clockoutEarly,
        late,
        absent,
        holiday,
        totalWorkHours,
        totalLateHours,
        totalEarlyHours,
        totalAbsentHours,
        totalLeaves,
        totalRemainingLeaves,
      ];
}
