import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:equatable/equatable.dart';

import 'payroll_component_model.dart';

class PayrollDetailModel extends Equatable {
  /// The `PayrollDetailModel` class represents a model for payroll details.
  ///
  /// It extends the `Equatable` class to enable easy equality comparisons.
  const PayrollDetailModel({
    required this.name,
    this.image,
    required this.designation,
    required this.status,
    this.paidOn,
    required this.totalEarning,
    required this.totalDeduction,
    required this.totalAmount,
    this.totalAmountAfterPinalty,
    this.resignPinaltyAmount,
    required this.earnings,
    this.deductions,
    required this.publicUrl,
  });

  /// The name of the payroll detail.
  final String name;

  /// The image of the payroll detail (optional).
  final String? image;

  /// The designation of the payroll detail.
  final String designation;

  /// The status of the payroll detail.
  final PayrollStatus status;

  /// The date when the payroll was paid (optional).
  final DateTime? paidOn;

  /// The total earning amount of the payroll detail.
  final double totalEarning;

  /// The total deduction amount of the payroll detail.
  final double totalDeduction;

  /// The total amount of the payroll detail.
  final double totalAmount;

  /// The total amount of the payroll detail after penalty (optional).
  final double? totalAmountAfterPinalty;

  /// The penalty amount for resignations (optional).
  final double? resignPinaltyAmount;

  /// The list of earnings components in the payroll detail.
  final List<PayrollComponentModel> earnings;

  /// The list of deduction components in the payroll detail (optional).
  final List<PayrollComponentModel>? deductions;

  /// The public URL associated with the payroll detail.
  final String publicUrl;

  /// Creates a new instance of the `PayrollDetailModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the payroll detail.
  factory PayrollDetailModel.fromJson(Map<String, dynamic> json) {
    return PayrollDetailModel(
      name: json["name"] ?? '',
      image: json["image"] ?? '',
      designation: json["designation"] ?? '',
      status: PayrollStatusConverter.fromString(json["status"]) ??
          PayrollStatus.generated,
      paidOn: json["paid_on"] != null
          ? DateTime.parse(json["paid_on"]).toLocal()
          : null,
      totalEarning: double.parse('${json["total_earning"] ?? 0}'),
      totalDeduction: double.parse('${json["total_deduction"] ?? 0}'),
      totalAmount: double.parse('${json["total_amount"] ?? 0}'),
      resignPinaltyAmount:
          double.parse('${json['resign_pinalty_amount'] ?? 0}'),
      totalAmountAfterPinalty:
          double.parse('${json['total_amount_after_pinalty'] ?? 0}'),
      earnings: json["earnings"] != null
          ? List<PayrollComponentModel>.from(
              json["earnings"].map((x) => PayrollComponentModel.fromJson(x)))
          : [],
      deductions: json["deductions"] != null
          ? List<PayrollComponentModel>.from(
              json["deductions"].map((x) => PayrollComponentModel.fromJson(x)))
          : [],
      publicUrl: json['public_url'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        name,
        image,
        designation,
        status,
        paidOn,
        totalEarning,
        totalDeduction,
        totalAmount,
        totalAmountAfterPinalty,
        resignPinaltyAmount,
        earnings,
        deductions,
        publicUrl,
      ];
}
