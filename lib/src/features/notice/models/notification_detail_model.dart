import 'package:equatable/equatable.dart';

/// The `NotificationDetailModel` class represents the details of a notification.
///
/// It contains properties for the notification's ID, title, description, file (optional), and date.
/// This class implements the `Equatable` class to enable value comparison based on its properties.
class NotificationDetailModel extends Equatable {
  /// Creates a new instance of the `NotificationDetailModel` class.
  ///
  /// The [id], [title], [date] parameters are required.
  /// The [description] and [file] parameters are optional and represent the notification's description and file, respectively.
  const NotificationDetailModel({
    required this.id,
    required this.title,
    this.description,
    this.file,
    required this.date,
  });

  /// The ID of the notification.
  final int id;

  /// The title of the notification.
  final String title;

  /// The description of the notification (optional).
  final String? description;

  /// The file associated with the notification (optional).
  final String? file;

  /// The date of the notification.
  final String date;

  /// Creates a new instance of the `NotificationDetailModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the notification details.
  /// The keys 'id', 'requester_name', 'requester_image', 'requester_designation', and 'requester_placement'
  /// are used to extract the corresponding values.
  factory NotificationDetailModel.fromJson(Map<String, dynamic> json) {
    return NotificationDetailModel(
      id: json['id'],
      title: json['requester_name'],
      description: json['requester_image'] ?? '',
      file: json['requester_designation'],
      date: json['requester_placement'],
    );
  }

  @override
  List<Object?> get props => [id, title, description, file, date];
}
