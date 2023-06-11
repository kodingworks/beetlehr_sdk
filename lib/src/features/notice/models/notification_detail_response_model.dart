import 'package:beetlehr_sdk/src/models/models.dart';

import 'notification_detail_model.dart';

/// The `NotificationDetailResponseModel` class represents a response model for notification details.
///
/// It contains a `NotificationDetailModel` object representing the notification details,
/// and an optional `MetaData` object.
class NotificationDetailResponseModel {
  /// The notification detail data.
  final NotificationDetailModel data;

  /// Additional metadata associated with the notification detail response (optional).
  final MetaData? meta;

  /// Creates a new instance of the `NotificationDetailResponseModel` class.
  ///
  /// The [data] parameter is required and represents the notification detail data.
  /// The [meta] parameter is optional and represents additional metadata associated with the response.
  NotificationDetailResponseModel({
    required this.data,
    this.meta,
  });

  /// Creates a new instance of the `NotificationDetailResponseModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the notification detail response data.
  /// The 'data' key is used to extract the notification detail data as a JSON map,
  /// which is then converted to a `NotificationDetailModel` object.
  /// The 'meta' key is used to extract the metadata as a JSON map,
  /// which is then converted to a `MetaData` object if it is not null.
  factory NotificationDetailResponseModel.fromJson(Map<String, dynamic> json) {
    return NotificationDetailResponseModel(
      data: NotificationDetailModel.fromJson(json['data']),
      meta: json['meta'] != null ? MetaData.fromJson(json['meta']) : null,
    );
  }
}
