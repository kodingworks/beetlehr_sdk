enum BreakTimeType { start, end }

/// Converts a string [type] to the corresponding BreakTimeType enum value.
/// Returns BreakTimeType.start if [type] is 'start', BreakTimeType.end if [type] is 'end', and null otherwise.
BreakTimeType? breakTimeTypefromString(String? type) {
  switch (type) {
    case 'start':
      return BreakTimeType.start;
    case 'end':
      return BreakTimeType.end;
    default:
      return null;
  }
}

extension BreakTimeTypeX on BreakTimeType {
  /// Converts the BreakTimeType enum value to its corresponding string representation.
  /// Returns 'start' for BreakTimeType.start and 'end' for BreakTimeType.end.
  String convertToString() {
    switch (this) {
      case BreakTimeType.start:
        return 'start';
      case BreakTimeType.end:
        return 'end';
    }
  }
}
