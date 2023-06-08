import 'package:beetlehr_sdk/src/models/models.dart';
import 'package:equatable/equatable.dart';

import 'network_file_model.dart';

/// Represents a response model for uploading files.
class UploadFilesResponseModel extends Equatable {
  /// The list of uploaded network files.
  final List<NetworkFileModel> data;

  /// Additional metadata associated with the file upload response.
  final MetaData meta;

  /// Constructs an [UploadFilesResponseModel] object.
  ///
  /// The [data] and [meta] parameters are required.
  const UploadFilesResponseModel({
    required this.data,
    required this.meta,
  });

  /// Constructs an [UploadFilesResponseModel] object from a JSON representation.
  factory UploadFilesResponseModel.fromJson(Map<String, dynamic> json) =>
      UploadFilesResponseModel(
        data: List<NetworkFileModel>.from(
            json["data"].map((x) => NetworkFileModel.fromJson(x))),
        meta: MetaData.fromJson(json["meta"]),
      );

  @override
  List<Object?> get props => [data, meta];
}
