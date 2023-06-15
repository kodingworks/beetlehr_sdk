import 'package:beetlehr_sdk/src/models/models.dart';
import 'package:equatable/equatable.dart';

import 'payroll_model.dart';

class PayrollResponseModel extends Equatable {
  /// The `PayrollResponseModel` class represents a response model for payroll data.
  ///
  /// It contains a list of `PayrollModel` objects and optional `MetaData`.
  const PayrollResponseModel({
    required this.data,
    this.meta,
  });

  /// The list of payroll data.
  final List<PayrollModel> data;

  /// Additional metadata for the payroll response (optional).
  final MetaData? meta;

  /// Creates a new instance of the `PayrollResponseModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the payroll response.
  factory PayrollResponseModel.fromJson(Map<String, dynamic> json) {
    return PayrollResponseModel(
      data: json["data"] != null
          ? List<PayrollModel>.from(
              json["data"].map((x) => PayrollModel.fromJson(x)))
          : [],
      meta: json['meta'] != null ? MetaData.fromJson(json["meta"]) : null,
    );
  }

  @override
  List<Object?> get props => [data, meta];
}
