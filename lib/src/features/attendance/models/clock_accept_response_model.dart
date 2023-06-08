import 'package:beetlehr_sdk/src/models/models.dart';

import 'clock_accept_model.dart';

/// The `ClockAcceptResponseModel` class represents a response model for clock acceptance.
///
/// This model contains a `ClockAcceptModel` instance that represents the acceptance status
/// of a clock entry, along with optional metadata related to the response.
class ClockAcceptResponseModel {
  /// The clock acceptance data.
  final ClockAcceptModel data;

  /// Additional metadata related to the response.
  final MetaData? meta;

  /// Creates a new instance of the `ClockAcceptResponseModel` class.
  ///
  /// The [data] parameter represents the clock acceptance data.
  /// The [meta] parameter represents additional metadata.
  ClockAcceptResponseModel({
    required this.data,
    this.meta,
  });

  /// Creates a new instance of the `ClockAcceptResponseModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the clock acceptance response.
  /// The keys in the JSON map are used to extract the corresponding values.
  factory ClockAcceptResponseModel.fromJson(Map<String, dynamic> json) =>
      ClockAcceptResponseModel(
        data: ClockAcceptModel.fromJson(json['data']),
        meta: json['meta'] != null ? MetaData.fromJson(json['meta']) : null,
      );

  /// Converts the `ClockAcceptResponseModel` instance to a JSON map.
  ///
  /// Returns a JSON map representation of the `ClockAcceptResponseModel` instance.
  Map<String, dynamic> toJson() => {
        'data': data.toJson(),
        'meta': meta?.toJson(),
      };
}
