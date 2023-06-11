import 'package:equatable/equatable.dart';

/// The `NotificationModel` class represents a notification model.
///
/// It contains properties for the ID, title, description, date, and file of a notification.
/// This class implements the `Equatable` class to enable value comparison based on its properties.
class NotificationModel extends Equatable {
  /// Creates a new instance of the `NotificationModel` class.
  ///
  /// The [id], [title], [description], [date], and [file] parameters are required.
  const NotificationModel({
    required this.id,
    required this.title,
    this.description,
    required this.date,
    this.file,
  });

  /// The ID of the notification.
  final int id;

  /// The title of the notification.
  final String title;

  /// The description of the notification (optional).
  final String? description;

  /// The date of the notification.
  final String date;

  /// The file associated with the notification (optional).
  final String? file;

  /// Creates a new instance of the `NotificationModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the notification data.
  /// The keys 'id', 'title', 'description', 'file', and 'date' are used to extract the corresponding values.
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      file: json['file'],
      date: json['date'],
    );
  }

  @override
  List<Object?> get props => [id, title, description, date, file];
}
