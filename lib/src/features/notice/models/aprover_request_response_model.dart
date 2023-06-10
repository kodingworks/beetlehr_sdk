import 'package:beetlehr_sdk/src/models/models.dart';

import 'aprover_response_model.dart';

class ApproverRequestResponseModel {
  final ApproverResponseModel data;
  final MetaData? meta;

  /// Constructs an instance of [ApproverRequestResponseModel].
  ///
  /// The [data] parameter represents the response data containing the approver information.
  /// The [meta] parameter represents additional metadata associated with the response (optional).
  ApproverRequestResponseModel({
    required this.data,
    this.meta,
  });

  /// Creates an instance of [ApproverRequestResponseModel] from a JSON map.
  ///
  /// The [json] parameter represents the JSON map from which to create the model instance.
  /// Returns an instance of [ApproverRequestResponseModel] populated with data from the JSON map.
  factory ApproverRequestResponseModel.fromJson(Map<String, dynamic> json) {
    return ApproverRequestResponseModel(
      data: ApproverResponseModel.fromJson(json['data']),
      meta: json['meta'] != null ? MetaData.fromJson(json['meta']) : null,
    );
  }
}
