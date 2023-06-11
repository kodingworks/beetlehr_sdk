import 'package:equatable/equatable.dart';

class ApproverResponseModel extends Equatable {
  const ApproverResponseModel({
    required this.approver,
    required this.type,
    required this.status,
  });

  /// The name of the approver.
  final String approver;

  /// The type of the approval request.
  final String type;

  /// The status of the approval request.
  final String status;

  /// Creates an instance of [ApproverResponseModel] from a JSON map.
  ///
  /// The [json] parameter represents the JSON map from which to create the model instance.
  /// Returns an instance of [ApproverResponseModel] populated with data from the JSON map.
  factory ApproverResponseModel.fromJson(Map<String, dynamic> json) {
    return ApproverResponseModel(
        approver: json['approver'] ?? '',
        type: json['type'],
        status: json['status']);
  }

  @override
  List<Object?> get props => [approver, type, status];
}
