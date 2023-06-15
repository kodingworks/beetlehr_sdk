import 'package:equatable/equatable.dart';

/// The `PayrollComponentModel` class represents a model for a payroll component.
///
/// It extends the `Equatable` class to enable easy equality comparisons.
class PayrollComponentModel extends Equatable {
  /// Creates a new instance of the `PayrollComponentModel` class.
  ///
  /// The [name] and [amount] parameters are required and represent the name and amount of the payroll component, respectively.
  const PayrollComponentModel({
    required this.name,
    required this.amount,
  });

  /// The name of the payroll component.
  final String name;

  /// The amount of the payroll component.
  final double amount;

  /// Creates a new instance of the `PayrollComponentModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the payroll component.
  /// The key 'name' is used to extract the name value, and the key 'amount' is used to extract the amount value.
  factory PayrollComponentModel.fromJson(Map<String, dynamic> json) {
    return PayrollComponentModel(
      name: json["name"],
      amount: double.parse('${json["amount"] ?? 0}'),
    );
  }

  @override
  List<Object?> get props => [name, amount];
}
