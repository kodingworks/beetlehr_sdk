import 'package:beetlehr_sdk/src/models/models.dart';

import 'payroll_detail_model.dart';

class PayrollDetailResponse {
  /// The `PayrollDetailResponse` class represents a response model for payroll details.
  ///
  /// It contains the `PayrollDetailModel` data and optional `MetaData`.
  PayrollDetailResponse({
    required this.data,
    this.meta,
  });

  /// The payroll detail data.
  final PayrollDetailModel data;

  /// Additional metadata for the payroll detail response (optional).
  final MetaData? meta;

  /// Creates a new instance of the `PayrollDetailResponse` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the payroll detail response.
  factory PayrollDetailResponse.fromJson(Map<String, dynamic> json) {
    return PayrollDetailResponse(
      data: PayrollDetailModel.fromJson(json["data"]),
      meta: MetaData.fromJson(json["meta"]),
    );
  }
}
