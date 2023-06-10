import 'package:beetlehr_sdk/src/models/models.dart';
import 'package:equatable/equatable.dart';

import 'aproval_request_model.dart';

/// The `ApprovalRequestResponseModel` class represents the response model for approval requests.
class ApprovalRequestResponseModel extends Equatable {
  /// The list of approval request data.
  final List<ApprovalRequestModel> data;

  /// Additional metadata associated with the approval request response.
  final MetaData? meta;

  /// Creates a new instance of the `ApprovalRequestResponseModel` class.
  ///
  /// The [data] parameter represents the list of approval request data.
  /// The [meta] parameter is optional and represents additional metadata associated with the response.
  const ApprovalRequestResponseModel({
    required this.data,
    this.meta,
  });

  /// Creates a new instance of the `ApprovalRequestResponseModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the approval request response data.
  /// The keys 'data' and 'meta' are used to extract the corresponding values.
  factory ApprovalRequestResponseModel.fromJson(Map<String, dynamic> json) {
    return ApprovalRequestResponseModel(
      data: json['data'] != null
          ? List<ApprovalRequestModel>.from(
              json["data"].map((x) => ApprovalRequestModel.fromJson(x)))
          : [],
      meta: json['meta'] != null ? MetaData.fromJson(json['meta']) : null,
    );
  }

  @override
  List<Object?> get props => [data, meta];

  @override
  bool get stringify => true;
}
