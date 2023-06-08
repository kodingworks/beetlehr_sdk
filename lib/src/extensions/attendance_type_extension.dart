enum AttendanceType {
  normal,
  clockOut,
}

/// Converts a string [type] to the corresponding AttendanceType enum value.
AttendanceType? attendanceTypeFromString(String? type) {
  switch (type) {
    case 'normal':
      return AttendanceType.normal;
    case 'clockout':
      return AttendanceType.clockOut;
    default:
      return null;
  }
}

extension AttendanceTypeX on AttendanceType {
  /// Converts the AttendanceType enum value to its corresponding string representation.
  String convertToString() {
    switch (this) {
      case AttendanceType.normal:
        return 'normal';
      case AttendanceType.clockOut:
        return 'clockout';
    }
  }
}
