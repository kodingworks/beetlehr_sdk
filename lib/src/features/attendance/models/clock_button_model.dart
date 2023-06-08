import 'package:equatable/equatable.dart';

/// The ClockButtonModel class represents a model for the clock button configuration.
///
/// This model contains information about the clock status, button type, message type, break type, and start break time.
///
/// This class extends the Equatable class to enable easy comparison and equality checks.
class ClockButtonModel extends Equatable {
  /// Indicates whether the clock is already clocked out.
  final bool isAlreadyClockout;

  /// The type of the clock button.
  final ClockButtonType type;

  /// The message type associated with the clock button.
  final ClockMessageType messageType;

  /// The break type associated with the clock button.
  final BreakType breakType;

  /// The start break time (optional).
  final String? startBreakTime;

  /// Creates a new instance of the ClockButtonModel class.
  ///
  /// The [isAlreadyClockout], [type], [messageType], [breakType], and [startBreakTime] parameters are required.
  const ClockButtonModel({
    required this.isAlreadyClockout,
    required this.type,
    required this.messageType,
    required this.breakType,
    required this.startBreakTime,
  });

  /// Creates a new ClockButtonModel instance from a JSON map.
  ///
  /// The [json] parameter contains the JSON data to create the model from.
  factory ClockButtonModel.fromJson(Map<String, dynamic> json) {
    return ClockButtonModel(
      isAlreadyClockout: json['is_already_clockout'] ?? false,
      type: clockButtonTypeFromString(json['type'] ?? ''),
      messageType: clockMessageTypeFromString(json['message_type'] ?? ''),
      breakType: breakTypeFromString(json['break_type'] ?? ''),
      startBreakTime: json['start_break_time'],
    );
  }

  /// Converts the ClockButtonModel instance to a JSON map.
  ///
  /// Returns a JSON map representation of the ClockButtonModel instance.
  Map<String, dynamic> toJson() {
    return {
      'is_already_clockout': isAlreadyClockout,
      'type': type.toCode(),
      'message_type': messageType.toCode(),
      'break_type': breakType.toCode(),
      'break_time': startBreakTime,
    };
  }

  @override
  List<Object?> get props => [
        isAlreadyClockout,
        type,
        messageType,
        breakType,
        startBreakTime,
      ];
}

/// The button type for clock operations.
enum ClockButtonType {
  clockIn,
  clockOut,
  none,
}

/// The break type for clock operations.
enum BreakType {
  start,
  end,
  none,
}

/// The message type for clock operations.
enum ClockMessageType {
  clockIn,
  clockOut,
  alreadyAttendance,
  none,
}

extension ClockButtonTypeX on ClockButtonType {
  /// Converts the ClockButtonType to its corresponding code.
  ///
  /// Returns the code representation of the ClockButtonType.
  String toCode() {
    switch (this) {
      case ClockButtonType.clockIn:
        return 'clockin';
      case ClockButtonType.clockOut:
        return 'clockout';
      default:
        return 'none';
    }
  }
}

/// Converts the provided [type] string to a ClockButtonType.
ClockButtonType clockButtonTypeFromString(String type) {
  switch (type) {
    case 'clockin':
      return ClockButtonType.clockIn;
    case 'clockout':
      return ClockButtonType.clockOut;
    default:
      return ClockButtonType.none;
  }
}

extension ClockMessageTypeX on ClockMessageType {
  /// Converts the ClockMessageType to its corresponding code.
  ///
  /// Returns the code representation of the ClockMessageType.
  String toCode() {
    switch (this) {
      case ClockMessageType.clockIn:
        return 'clockin';
      case ClockMessageType.clockOut:
        return 'clockout';
      case ClockMessageType.alreadyAttendance:
        return 'already clockout';
      default:
        return 'none';
    }
  }
}

/// Converts the provided [type] string to a ClockMessageType.
ClockMessageType clockMessageTypeFromString(String type) {
  switch (type) {
    case 'clockin':
      return ClockMessageType.clockIn;
    case 'clockout':
      return ClockMessageType.clockOut;
    case 'already clockout':
      return ClockMessageType.alreadyAttendance;
    default:
      return ClockMessageType.none;
  }
}

extension BreakTypeX on BreakType {
  /// Converts the BreakType to its corresponding code.
  ///
  /// Returns the code representation of the BreakType.
  String toCode() {
    switch (this) {
      case BreakType.start:
        return 'start';
      case BreakType.end:
        return 'end';
      default:
        return 'none';
    }
  }
}

/// Converts the provided [type] string to a BreakType.
BreakType breakTypeFromString(String type) {
  switch (type) {
    case 'start':
      return BreakType.start;
    case 'end':
      return BreakType.end;
    default:
      return BreakType.none;
  }
}
