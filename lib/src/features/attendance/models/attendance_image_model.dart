import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:equatable/equatable.dart';

/// Model class for attendance images.
class AttendanceImageModel extends Equatable {
  /// Constructs an instance of [AttendanceImageModel].
  const AttendanceImageModel({
    required this.id, // ID of the image
    required this.url, // URL of the image
    this.fileName, // Filename of the image
    this.extensionFile, // Extension of the image file
    this.size, // Size of the image file
    this.workingFrom, // Type of working from
  });

  final int id; // ID of the image
  final String url; // URL of the image
  final String? fileName; // Filename of the image (nullable)
  final String? extensionFile; // Extension of the image file (nullable)
  final double? size; // Size of the image file (nullable)
  final WorkingFromType? workingFrom; // Type of working from (nullable)

  /// Constructs an instance of [AttendanceImageModel] from a JSON object.
  factory AttendanceImageModel.fromJson(Map<String, dynamic> json) =>
      AttendanceImageModel(
        id: json['id'],
        url: json['url'],
        fileName: json['file_name'],
        extensionFile: json['extension'],
        size: double.tryParse(json['size']),
        workingFrom: workingFromTypeFromString(json['status']),
      );

  /// Converts this [AttendanceImageModel] instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'file_name': fileName,
      'extension': extensionFile,
      'size': size,
      'status': workingFrom?.convertToString(),
    };
  }

  @override
  List<Object?> get props =>
      [id, url, fileName, extensionFile, size, workingFrom];
}
