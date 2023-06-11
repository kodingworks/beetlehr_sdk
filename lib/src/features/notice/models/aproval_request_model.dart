import 'package:equatable/equatable.dart';

import 'metadata_aproval_model.dart';

/// The `ApprovalRequestModel` class represents an approval request.
///
/// It contains information such as the request ID, request name, request image, type, type label,
/// request timestamp, status, status label, and optional metadata.
class ApprovalRequestModel extends Equatable {
  /// The unique identifier of the approval request.
  final int id;

  /// The name of the requester.
  final String requestName;

  /// The image associated with the requester.
  final String? requestImage;

  /// The type of the approval request.
  final String type;

  /// The label for the approval request type.
  final String typeLabel;

  /// The timestamp when the request was made.
  final String requestAt;

  /// The status of the approval request.
  final String status;

  /// The label for the approval request status.
  final String statusLabel;

  /// The optional metadata associated with the approval request.
  final MetaDataApprovalModel? metaData;

  /// Creates a new instance of the `ApprovalRequestModel` class.
  ///
  /// The [id] parameter represents the unique identifier of the approval request.
  /// The [requestName] parameter represents the name of the requester.
  /// The [requestImage] parameter is optional and represents the image associated with the requester.
  /// The [type] parameter represents the type of the approval request.
  /// The [typeLabel] parameter represents the label for the approval request type.
  /// The [requestAt] parameter represents the timestamp when the request was made.
  /// The [status] parameter represents the status of the approval request.
  /// The [statusLabel] parameter represents the label for the approval request status.
  /// The [metaData] parameter is optional and represents the metadata associated with the approval request.
  const ApprovalRequestModel({
    required this.id,
    required this.requestName,
    this.requestImage,
    required this.type,
    required this.typeLabel,
    required this.requestAt,
    required this.status,
    required this.statusLabel,
    this.metaData,
  });

  /// Creates a new instance of the `ApprovalRequestModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the approval request data.
  /// The keys 'id', 'requester_name', 'requester_image', 'type', 'type_label',
  /// 'requested_at', 'status', 'status_label', and 'meta_data' are used to extract the corresponding values.
  factory ApprovalRequestModel.fromJson(Map<String, dynamic> json) {
    return ApprovalRequestModel(
      id: json['id'],
      requestName: json['requester_name'],
      requestImage: json['requester_image'],
      type: json['type'],
      typeLabel: json['type_label'],
      requestAt: json['requested_at'],
      status: json['status'],
      statusLabel: json['status_label'],
      metaData: json['meta_data'] != null
          ? MetaDataApprovalModel.fromJson(json['meta_data'])
          : null,
    );
  }

  @override
  List<Object?> get props => [
        id,
        requestName,
        requestImage,
        type,
        typeLabel,
        requestAt,
        status,
        statusLabel,
        metaData,
      ];
}
