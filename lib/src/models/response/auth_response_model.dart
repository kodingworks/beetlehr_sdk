import 'package:beetlehr_sdk/src/models/models.dart';
import 'package:equatable/equatable.dart';

/// The `AuthResponseModel` class represents a model for the authentication response.
class AuthResponseModel extends Equatable {
  /// Creates a new instance of the `AuthResponseModel` class.
  ///
  /// The [user], [token], and [meta] parameters are required.
  const AuthResponseModel({
    required this.user,
    required this.token,
    this.meta,
  });

  /// The authentication token.
  final String token;

  /// Additional metadata associated with the authentication response.
  final MetaData? meta;

  /// The user associated with the authentication response.
  final UserModel user;

  /// Creates a new instance of the `AuthResponseModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the authentication response.
  /// The keys 'data', 'token', and 'meta' are used to extract the corresponding values.
  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        user: UserModel.fromJson(json["data"]),
        token: json["token"],
        meta: json["meta"] == null ? null : MetaData.fromJson(json["meta"]),
      );

  /// Converts the `AuthResponseModel` instance to a JSON map.
  ///
  /// Returns a JSON map representation of the `AuthResponseModel` instance.
  Map<String, dynamic> toJson() => {
        "data": user.toJson(),
        "token": token,
        "meta": meta?.toJson(),
      };

  /// Returns a list of properties used for value comparison.
  @override
  List<Object?> get props => [user, token, meta];

  /// Specifies whether the object should be stringified.
  @override
  bool get stringify => true;
}
