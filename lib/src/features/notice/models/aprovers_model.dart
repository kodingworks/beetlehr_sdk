import 'package:equatable/equatable.dart';

/// The `ApproversModel` class represents an approver of an approval request.
class ApproversModel extends Equatable {
  /// The ID of the user.
  final int userId;

  /// The name of the approver.
  final String approverName;

  /// The image URL of the approver.
  final String? approverImage;

  /// The designation of the approver.
  final String designation;

  /// The status of the approval.
  final String status;

  /// The label of the approval status.
  final String statusLabel;

  /// The reason for the approval.
  final String? reason;

  /// The timestamp of the approval.
  final String? timestamp;

  /// The GMT timestamp of the approval.
  final String? timestampGmt;

  /// Creates an instance of the `ApproversModel` class.
  ///
  /// The [userId] parameter represents the ID of the user.
  /// The [approverName] parameter represents the name of the approver.
  /// The [approverImage] parameter represents the image URL of the approver.
  /// The [designation] parameter represents the designation of the approver.
  /// The [status] parameter represents the status of the approval.
  /// The [statusLabel] parameter represents the label of the approval status.
  /// The [reason] parameter represents the reason for the approval.
  /// The [timestamp] parameter represents the timestamp of the approval.
  /// The [timestampGmt] parameter represents the GMT timestamp of the approval.
  const ApproversModel({
    required this.userId,
    required this.approverName,
    this.approverImage,
    required this.designation,
    required this.status,
    required this.statusLabel,
    required this.reason,
    required this.timestamp,
    required this.timestampGmt,
  });

  /// Creates an instance of the `ApproversModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the approver.
  factory ApproversModel.fromJson(Map<String, dynamic> json) {
    return ApproversModel(
      userId: json['user_id'],
      approverName: json['approver_name'],
      approverImage: json['approver_image'] ?? '',
      designation: json['designation'],
      status: json['status'],
      statusLabel: json['status_label'],
      reason: json['reason'] ?? '',
      timestamp: json['timestamp'] ?? '',
      timestampGmt: json['timestamp_gmt'] ?? '',
    );
  }

  /// Converts the `ApproversModel` instance to a JSON map.
  ///
  /// Returns a JSON map representation of the `ApproversModel` instance.
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'approver_name': approverName,
      'approver_image': approverImage,
      'designation': designation,
      'status': status,
      'status_label': statusLabel,
      'reason': reason,
      'timestamp': timestamp,
      'timestamp_gmt': timestampGmt,
    };
  }

  @override
  List<Object?> get props => [
        userId,
        approverName,
        approverImage,
        designation,
        status,
        statusLabel,
        reason,
        timestamp,
        timestampGmt,
      ];
}
