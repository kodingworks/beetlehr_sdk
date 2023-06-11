import 'package:beetlehr_sdk/src/models/models.dart';
import 'package:equatable/equatable.dart';

import 'notice_model.dart';

/// The `NoticeBoardResponseModel` class represents a response model for the notice board data.
///
/// It contains a list of `NoticeModel` objects and optional metadata.
class NoticeBoardResponseModel extends Equatable {
  /// The list of notice data.
  final List<NoticeModel> data;

  /// The metadata associated with the response.
  final MetaData? meta;

  /// Creates a new instance of the `NoticeBoardResponseModel` class.
  ///
  /// The [data] parameter represents the list of notice data.
  /// The [meta] parameter is optional and represents the metadata associated with the response.
  const NoticeBoardResponseModel({
    required this.data,
    this.meta,
  });

  /// Creates a new instance of the `NoticeBoardResponseModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the response data.
  /// The keys 'data' and 'meta' are used to extract the corresponding values.
  factory NoticeBoardResponseModel.fromJson(Map<String, dynamic> json) {
    return NoticeBoardResponseModel(
      data: json['data'] != null
          ? List<NoticeModel>.from(
              json["data"].map((x) => NoticeModel.fromJson(x)))
          : [],
      meta: json['meta'] != null ? MetaData.fromJson(json['meta']) : null,
    );
  }

  @override
  List<Object?> get props => [data, meta];

  @override
  bool get stringify => true;
}
