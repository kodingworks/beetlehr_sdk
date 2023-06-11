import 'package:equatable/equatable.dart';

/// The `NoticeModel` class represents a notice item.
///
/// It contains information such as the notice ID, title, description, date, and an optional file.
class NoticeModel extends Equatable {
  /// The unique identifier of the notice.
  final int id;

  /// The title of the notice.
  final String title;

  /// The description of the notice.
  final String? description;

  /// The date of the notice.
  final String date;

  /// The optional file associated with the notice.
  final String? file;

  /// Creates a new instance of the `NoticeModel` class.
  ///
  /// The [id] parameter represents the unique identifier of the notice.
  /// The [title] parameter represents the title of the notice.
  /// The [description] parameter is optional and represents the description of the notice.
  /// The [date] parameter represents the date of the notice.
  /// The [file] parameter is optional and represents the file associated with the notice.
  const NoticeModel({
    required this.id,
    required this.title,
    this.description,
    required this.date,
    this.file,
  });

  /// Creates a new instance of the `NoticeModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the notice data.
  /// The keys 'id', 'title', 'description', 'date', and 'file' are used to extract the corresponding values.
  factory NoticeModel.fromJson(Map<String, dynamic> json) {
    return NoticeModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      file: json['file'],
    );
  }

  @override
  List<Object?> get props => [id, title, description, date, file];
}
