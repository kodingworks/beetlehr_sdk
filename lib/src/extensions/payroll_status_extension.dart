/// Enum representing the status of a payroll.
enum PayrollStatus {
  /// The payroll has been generated.
  generated,

  /// The payroll has been paid.
  paid,
}

/// A utility class for converting `PayrollStatus` values to and from strings.
class PayrollStatusConverter {
  /// Converts a string value to the corresponding `PayrollStatus` enum value.
  ///
  /// Returns the `PayrollStatus` enum value that corresponds to the given string [v].
  /// If [v] is 'Generated', [PayrollStatus.generated] is returned.
  /// If [v] is 'Paid', [PayrollStatus.paid] is returned.
  /// If [v] is null or does not match any valid value, null is returned.
  static PayrollStatus? fromString(String? v) {
    switch (v) {
      case 'Generated':
        return PayrollStatus.generated;
      case 'Paid':
        return PayrollStatus.paid;
      default:
        return null;
    }
  }

  /// Converts a `PayrollStatus` enum value to its corresponding string representation.
  ///
  /// Returns the string representation of the given [v] `PayrollStatus` enum value.
  /// If [v] is [PayrollStatus.generated], the string 'Generated' is returned.
  /// If [v] is [PayrollStatus.paid], the string 'Paid' is returned.
  /// If [v] is null or does not match any valid value, null is returned.
  static String? convertToString(PayrollStatus? v) {
    switch (v) {
      case PayrollStatus.generated:
        return 'Generated';
      case PayrollStatus.paid:
        return 'Paid';
      default:
        return null;
    }
  }
}
