import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:equatable/equatable.dart';

/// The CheckAcceptClockBodyModel class represents a model for the request body used to check and accept clock entries.
///
/// This model contains information about the date, clock time, attendance type, and overtime ID (optional).
///
/// This class extends the Equatable class to enable easy comparison and equality checks.
class CheckAcceptClockBodyModel extends Equatable {
  /// The date of the clock entry.
  final DateTime date;

  /// The clock time of the entry.
  final String clock;

  /// The type of attendance (e.g., clock-in, clock-out).
  final AttendanceType type;

  /// The ID of the associated overtime (optional).
  final int? overtimeId;

  /// Creates a new instance of the CheckAcceptClockBodyModel class.
  ///
  /// The [date], [clock], and [type] parameters are required.
  /// The [overtimeId] parameter is optional and defaults to null.
  const CheckAcceptClockBodyModel({
    required this.date,
    required this.clock,
    required this.type,
    this.overtimeId,
  });

  /// Converts the CheckAcceptClockBodyModel instance to a JSON map.
  ///
  /// Returns a JSON map representation of the CheckAcceptClockBodyModel instance.
  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "clock": clock,
        "type": type.convertToString(),
        'overtime_id': overtimeId,
      };

  @override
  List<Object> get props => [date, clock, type];

  @override
  bool get stringify => true;
}
