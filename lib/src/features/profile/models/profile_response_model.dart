import 'package:beetlehr_sdk/src/models/models.dart';
import 'package:equatable/equatable.dart';

import 'profile_model.dart';

/// The `ProfileResponseModel` class represents a model for a response containing user profile data.
class ProfileResponseModel extends Equatable {
  /// The user profile data.
  final ProfileModel data;

  /// Additional metadata associated with the response (optional).
  final MetaData? meta;

  /// Creates a new instance of the `ProfileResponseModel` class.
  ///
  /// The [data] parameter is required and represents the user profile data.
  /// The [meta] parameter is optional and represents additional metadata associated with the response.
  const ProfileResponseModel({required this.data, this.meta});

  /// Creates a new instance of the `ProfileResponseModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the response data.
  /// The keys 'data' and 'meta' are used to extract the corresponding values.
  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModel(
      data: ProfileModel.fromJson(json['data']),
      meta: MetaData.fromJson(json['meta']),
    );
  }

  @override
  List<Object?> get props => [data, meta];
}
