/// Enum representing the types of approval requests.
enum ApprovalRequestType {
  /// The request is awaiting approval.
  awaiting,

  /// The request has been rejected.
  rejected,

  /// The request has been approved.
  approved,
}

/// Converts a string representation of an approval request type to the corresponding enum value.
///
/// The [type] parameter represents the string value to convert.
///
/// Returns the `ApprovalRequestType` enum value corresponding to the given string, or `null` if no match is found.
ApprovalRequestType? approvalRequestTypefromString(String? type) {
  switch (type) {
    case 'awaiting':
      return ApprovalRequestType.awaiting;
    case 'rejected':
      return ApprovalRequestType.rejected;
    case 'approved':
      return ApprovalRequestType.approved;
    default:
      return null;
  }
}

/// Extension providing additional functionality for the `ApprovalRequestType` enum.
extension ApprovalRequestTypeX on ApprovalRequestType {
  /// Converts the approval request type to its string representation.
  ///
  /// Returns the string representation of the `ApprovalRequestType` enum value.
  String convertToString() {
    switch (this) {
      case ApprovalRequestType.awaiting:
        return 'awaiting';
      case ApprovalRequestType.rejected:
        return 'rejected';
      case ApprovalRequestType.approved:
        return 'approved';
    }
  }
}
