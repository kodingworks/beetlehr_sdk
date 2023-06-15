import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:equatable/equatable.dart';

class PayrollModel extends Equatable {
  /// The `PayrollModel` class represents a model for a payroll.
  ///
  /// It extends the `Equatable` class to enable easy equality comparisons.
  const PayrollModel({
    required this.id,
    required this.name,
    this.date,
    required this.status,
    required this.totalAmount,
  });

  /// The ID of the payroll.
  final int id;

  /// The name of the payroll.
  final String name;

  /// The date of the payroll (optional).
  final DateTime? date;

  /// The status of the payroll.
  final PayrollStatus status;

  /// The total amount of the payroll.
  final double totalAmount;

  /// Creates a new instance of the `PayrollModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the payroll.
  factory PayrollModel.fromJson(Map<String, dynamic> json) {
    return PayrollModel(
      id: json["id"],
      name: json["name"],
      date:
          json["date"] == null ? null : DateTime.parse(json["date"]).toLocal(),
      status: PayrollStatusConverter.fromString(json["status"]) ??
          PayrollStatus.generated,
      totalAmount: double.parse('${json["total_amount"] ?? 0}'),
    );
  }

  @override
  List<Object?> get props => [id, name, date, status, totalAmount];
}
