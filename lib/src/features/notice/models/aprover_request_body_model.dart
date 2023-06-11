import 'package:equatable/equatable.dart';

/// Represents the request body data for approving a request.
class ApproverRequestBodyModel extends Equatable {
  /// The reason for approving the request.
  final String? reason;

  /// The type of approval.
  final String type;

  /// Creates a new instance of [ApproverRequestBodyModel].
  ///
  /// The [reason] is optional and can be provided to add additional context
  /// to the approval. The [type] specifies the type of approval.
  const ApproverRequestBodyModel({
    this.reason,
    required this.type,
  });

  /// Converts the [ApproverRequestBodyModel] instance to a JSON map.
  Map<String, dynamic> toJson() => {
        "reason": reason,
        "type": type,
      };

  @override
  List<Object?> get props => [reason, type];

  @override
  bool get stringify => true;
}
