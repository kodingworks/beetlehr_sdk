/// Enum that represents the types of working from.
enum WorkingFromType {
  /// Represents working from the office.
  office,

  /// Represents working from anywhere.
  anywhere,
}

/// Converts a string to a [WorkingFromType] enum value.
WorkingFromType? workingFromTypeFromString(String? type) {
  switch (type) {
    /// Matches 'wfa' and returns [WorkingFromType.anywhere].
    case 'wfa':
      return WorkingFromType.anywhere;

    /// Matches 'wfo' and returns [WorkingFromType.office].
    case 'wfo':
      return WorkingFromType.office;

    /// Returns null for any other input.
    default:
      return null;
  }
}

/// Extension on [WorkingFromType] to convert it to a string.
extension WorkFromTypeX on WorkingFromType {
  /// Converts the [WorkingFromType] enum value to a string.
  String convertToString() {
    switch (this) {
      /// Converts [WorkingFromType.anywhere] to 'wfa'.
      case WorkingFromType.anywhere:
        return 'wfa';

      /// Converts [WorkingFromType.office] to 'wfo'.
      case WorkingFromType.office:
        return 'wfo';
    }
  }
}
