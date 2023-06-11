import 'package:beetlehr_sdk/src/models/models.dart';

import 'notification_model.dart';

/// The `NotificationResponseModel` class represents a response model for notifications.
///
/// It contains a list of `NotificationModel` objects and an optional `MetaData` object.
class NotificationResponseModel {
  /// The list of notification data.
  final List<NotificationModel> data;

  /// Additional metadata associated with the notification response (optional).
  final MetaData? meta;

  /// Creates a new instance of the `NotificationResponseModel` class.
  ///
  /// The [data] parameter is required and represents the list of notification data.
  /// The [meta] parameter is optional and represents additional metadata associated with the response.
  NotificationResponseModel({
    required this.data,
    this.meta,
  });

  /// Creates a new instance of the `NotificationResponseModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the notification response data.
  /// The keys 'data' and 'meta' are used to extract the corresponding values.
  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    return NotificationResponseModel(
      data: json['data'] != null
          ? List<NotificationModel>.from(
              json["data"].map((x) => NotificationModel.fromJson(x)))
          : [],
      meta: json['meta'] != null ? MetaData.fromJson(json['meta']) : null,
    );
  }
}
