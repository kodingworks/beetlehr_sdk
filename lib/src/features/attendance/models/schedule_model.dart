import 'package:equatable/equatable.dart';

/// The ScheduleModel class represents a model for a schedule.
///
/// This model contains information about a specific schedule, including ID, date,
/// leave status, start time, end time, and name.
///
/// This class extends the Equatable class to enable easy comparison and equality checks.
class ScheduleModel extends Equatable {
  /// The unique identifier of the schedule.
  final int id;

  /// The date of the schedule.
  final DateTime date;

  /// Indicates whether the schedule is for leave.
  final int? isLeave;

  /// The start time of the schedule.
  final String? timeStart;

  /// The end time of the schedule.
  final String? timeEnd;

  /// The name of the schedule.
  final String? name;

  /// Creates a new instance of the ScheduleModel class.
  ///
  /// The [id], [date], and [name] parameters are required.
  /// The [isLeave], [timeStart], and [timeEnd] parameters are optional.
  const ScheduleModel({
    required this.id,
    required this.date,
    this.isLeave,
    this.timeStart,
    this.timeEnd,
    this.name,
  });

  /// Creates a new instance of the ScheduleModel class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the schedule details.
  /// The keys in the JSON map are used to extract the corresponding values.
  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        id: json["id"],
        date: DateTime.parse(json["date"]).toLocal(),
        isLeave: json["is_leave"],
        timeStart: json['shift'] != null ? json['shift']['time_start'] : null,
        timeEnd: json['shift'] != null ? json['shift']['time_end'] : null,
        name: json['shift'] != null ? json['shift']['name'] : null,
      );

  /// Converts the ScheduleModel instance to a JSON map.
  ///
  /// Returns a JSON map representation of the ScheduleModel instance.
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "date": date.toIso8601String(),
      "is_leave": isLeave,
      "shift": {
        'time_start': timeStart,
        'time_end': timeEnd,
        'name': name,
      },
    };
  }

  @override
  List<Object?> get props => [id, date, isLeave, timeStart, timeEnd, name];
}
