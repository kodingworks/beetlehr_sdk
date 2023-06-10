import 'package:beetlehr_sdk/src/models/models.dart';

import 'aproval_detail_request_model.dart';

/// The `ApprovalRequestDetailResponseModel` class represents the response of an approval request detail.
class ApprovalRequestDetailResponseModel {
  /// The data of the approval request detail.
  final ApprovalRequestDetailDataModel data;

  /// The metadata associated with the approval request detail.
  final MetaData? meta;

  /// Creates an instance of the `ApprovalRequestDetailResponseModel` class.
  ///
  /// The [data] parameter represents the approval request detail data.
  /// The [meta] parameter represents the metadata associated with the approval request detail.
  ApprovalRequestDetailResponseModel({
    required this.data,
    this.meta,
  });

  /// Creates an instance of the `ApprovalRequestDetailResponseModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the approval request detail response.
  factory ApprovalRequestDetailResponseModel.fromJson(
      Map<String, dynamic> json) {
    return ApprovalRequestDetailResponseModel(
      data: ApprovalRequestDetailDataModel.fromJson(json['data']),
      meta: json['meta'] != null ? MetaData.fromJson(json['meta']) : null,
    );
  }
}
