import 'package:equatable/equatable.dart';

/// The `MetaDataApprovalModel` class represents metadata associated with an approval request.
class MetaDataApprovalModel extends Equatable {
  /// The start time of the approval request.
  final String? startTime;

  /// The end time of the approval request.
  final String? endTime;

  /// The duration of the approval request.
  final int? duration;

  /// The label for the approval request type.
  final String? typeLabel;

  /// The reason for the approval request.
  final String? reason;

  /// The additional file associated with the approval request.
  final String? additionalFile;

  /// The note for the approval request.
  final String? note;

  /// Creates a new instance of the `MetaDataApprovalModel` class.
  ///
  /// The [startTime] parameter represents the start time of the approval request.
  /// The [endTime] parameter represents the end time of the approval request.
  /// The [duration] parameter represents the duration of the approval request.
  /// The [typeLabel] parameter represents the label for the approval request type.
  /// The [reason] parameter represents the reason for the approval request.
  /// The [additionalFile] parameter represents the additional file associated with the approval request.
  /// The [note] parameter represents the note for the approval request.
  const MetaDataApprovalModel({
    required this.startTime,
    required this.endTime,
    required this.duration,
    required this.typeLabel,
    required this.reason,
    required this.additionalFile,
    required this.note,
  });

  /// Creates a new instance of the `MetaDataApprovalModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the metadata approval data.
  /// The keys 'start_date', 'end_date', 'duration', 'type_label', 'reason',
  /// 'additional_file', and 'note' are used to extract the corresponding values.
  factory MetaDataApprovalModel.fromJson(Map<String, dynamic> json) {
    return MetaDataApprovalModel(
      startTime: json['start_date'],
      endTime: json['end_date'],
      duration: json['duration'] ?? 0,
      typeLabel: json['type_label'] ?? '',
      reason: json['reason'] ?? '',
      additionalFile: json['additional_file'] ?? '',
      note: json['note'] ?? '',
    );
  }

  /// Converts the `MetaDataApprovalModel` instance to a JSON map.
  ///
  /// Returns a JSON map representation of the `MetaDataApprovalModel` instance.
  Map<String, dynamic> toJson() {
    return {
      'start_date': startTime,
      'end_date': endTime,
      'duration': duration,
      'type_label': typeLabel,
      'reason': reason,
      'additional_file': additionalFile,
      'note': note,
    };
  }

  @override
  List<Object?> get props => [
        startTime,
        endTime,
        duration,
        typeLabel,
        reason,
        additionalFile,
        note,
      ];
}
