import 'package:beetlehr_sdk/src/models/models.dart';
import 'package:equatable/equatable.dart';

import 'schedule_model.dart';

/// The ScheduleResponseModel class represents a model for a schedule response.
///
/// This model contains a list of schedule models and optional metadata.
///
/// This class extends the Equatable class to enable easy comparison and equality checks.
class ScheduleResponseModel extends Equatable {
  /// The list of schedule models.
  final List<ScheduleModel> data;

  /// The metadata associated with the schedule response.
  final MetaData? meta;

  /// Creates a new instance of the ScheduleResponseModel class.
  ///
  /// The [data] parameter is required, and [meta] is optional.
  const ScheduleResponseModel({
    required this.data,
    this.meta,
  });

  /// Creates a new instance of the ScheduleResponseModel class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the schedule response.
  /// The keys in the JSON map are used to extract the corresponding values.
  factory ScheduleResponseModel.fromJson(Map<String, dynamic> json) =>
      ScheduleResponseModel(
        data: json['data'] != null
            ? List<ScheduleModel>.from(
                json["data"].map((x) => ScheduleModel.fromJson(x)))
            : [],
        meta: json['meta'] != null ? MetaData.fromJson(json["meta"]) : null,
      );

  /// Converts the ScheduleResponseModel instance to a JSON map.
  ///
  /// Returns a JSON map representation of the ScheduleResponseModel instance.
  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };

  @override
  List<Object?> get props => [data, meta];

  @override
  bool get stringify => true;
}
