import 'package:beetlehr_sdk/src/models/models.dart';

import 'breaktime_model.dart';

/// Represents a response model for break time information.
class BreakTimeResponseModel {
  /// The break time data.
  final BreakTimeModel data;

  /// Additional metadata associated with the break time response.
  final MetaData? meta;

  /// Constructs a [BreakTimeResponseModel] object.
  ///
  /// The [data] parameter is required, while [meta] is optional.
  BreakTimeResponseModel({
    required this.data,
    this.meta,
  });

  /// Constructs a [BreakTimeResponseModel] object from a JSON representation.
  factory BreakTimeResponseModel.fromJson(Map<String, dynamic> json) =>
      BreakTimeResponseModel(
        data: BreakTimeModel.fromJson(json["data"]),
        meta: json['meta'] != null ? MetaData.fromJson(json["meta"]) : null,
      );

  /// Converts the [BreakTimeResponseModel] object to a JSON representation.
  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "meta": meta?.toJson(),
      };
}
