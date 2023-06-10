import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:equatable/equatable.dart';

import 'aprovers_model.dart';
import 'metadata_aproval_model.dart';

/// The `ApprovalRequestDetailDataModel` class represents the detailed data of an approval request.
class ApprovalRequestDetailDataModel extends Equatable {
  const ApprovalRequestDetailDataModel({
    required this.id,
    required this.requesterName,
    this.requesterImage,
    required this.requesterDesignation,
    required this.requesterPlacement,
    required this.type,
    required this.isApprovable,
    required this.status,
    required this.statusLabel,
    required this.metaData,
    required this.approvers,
  });

  /// The unique identifier of the approval request.
  final int id;

  /// The name of the requester.
  final String requesterName;

  /// The image of the requester.
  final String? requesterImage;

  /// The designation of the requester.
  final String requesterDesignation;

  /// The placement of the requester.
  final String requesterPlacement;

  /// The type of the approval request.
  final String type;

  /// Indicates whether the approval request is approvable.
  final bool isApprovable;

  /// The status of the approval request.
  final ApprovalRequestType status;

  /// The label corresponding to the status of the approval request.
  final String statusLabel;

  /// The metadata of the approval request.
  final MetaDataApprovalModel metaData;

  /// The list of approvers associated with the approval request.
  final List<ApproversModel> approvers;

  /// Creates an instance of the `ApprovalRequestDetailDataModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the approval request data.
  factory ApprovalRequestDetailDataModel.fromJson(Map<String, dynamic> json) {
    return ApprovalRequestDetailDataModel(
      id: json['id'],
      requesterName: json['requester_name'],
      requesterImage: json['requester_image'] ?? '',
      requesterDesignation: json['requester_designation'],
      requesterPlacement: json['requester_placement'],
      type: json['type'],
      isApprovable: json['is_approvable'],
      status: approvalRequestTypefromString(json['status']) ??
          ApprovalRequestType.awaiting,
      statusLabel: json['status_label'],
      metaData: MetaDataApprovalModel.fromJson(json['meta_data']),
      approvers: json["approvers"] != null
          ? List<ApproversModel>.from(
              json["approvers"].map((x) => ApproversModel.fromJson(x)))
          : [],
    );
  }

  @override
  List<Object?> get props => [
        id,
        requesterName,
        requesterImage,
        requesterDesignation,
        requesterPlacement,
        type,
        isApprovable,
        status,
        statusLabel,
        metaData,
        approvers,
      ];
}
