/// Enum that represents the types of attendance clock.
enum AttendanceClockType {
  /// Represents clock-in type.
  clockIn,

  /// Represents clock-out type.
  clockOut,

  /// Represents raw clock-out type.
  clockOutRaw,
}

/// Converts a string to an [AttendanceClockType] enum value.
AttendanceClockType? attendanceClockTypeFromString(String? type) {
  switch (type) {
    /// Matches 'in' or 'clockin' and returns [AttendanceClockType.clockIn].
    case 'in':
    case 'clockin':
      return AttendanceClockType.clockIn;

    /// Matches 'out' or 'clockout' and returns [AttendanceClockType.clockOut].
    case 'out':
    case 'clockout':
      return AttendanceClockType.clockOut;

    /// Returns null for any other input.
    default:
      return null;
  }
}

/// Extension on [AttendanceClockType] to convert it to a string.
extension AttendanceClockTypeX on AttendanceClockType {
  /// Converts the [AttendanceClockType] enum value to a string.
  String convertToString() {
    switch (this) {
      /// Converts [AttendanceClockType.clockIn] to 'in'.
      case AttendanceClockType.clockIn:
        return 'in';

      /// Converts [AttendanceClockType.clockOut] to 'out'.
      case AttendanceClockType.clockOut:
        return 'out';

      /// Converts [AttendanceClockType.clockOutRaw] to 'clockout'.
      case AttendanceClockType.clockOutRaw:
        return 'clockout';
    }
  }
}
