import 'package:equatable/equatable.dart';

/// Represents a model for network file information.
class NetworkFileModel extends Equatable {
  /// The unique identifier for the network file.
  final int id;

  /// The URL of the network file.
  final String url;

  /// The name of the file.
  final String? fileName;

  /// The extension of the file.
  final String? extensionFile;

  /// The size of the file.
  final double? size;

  /// Constructs a [NetworkFileModel] object.
  ///
  /// The [id] and [url] parameters are required, while the rest are optional.
  NetworkFileModel({
    required this.id,
    required this.url,
    this.fileName,
    this.extensionFile,
    this.size,
  });

  /// Constructs a [NetworkFileModel] object from a JSON representation.
  factory NetworkFileModel.fromJson(Map<String, dynamic> json) =>
      NetworkFileModel(
        id: json["id"],
        url: json["url"],
        fileName: json["file_name"],
        extensionFile: json["extension"],
        size: double.parse('${json['size'] ?? 0}'),
      );

  @override
  List<Object?> get props => [
        id,
        url,
        fileName,
        extensionFile,
        size,
      ];
}
