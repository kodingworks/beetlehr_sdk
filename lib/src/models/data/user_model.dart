import 'package:beetlehr_sdk/src/entities/entities.dart';

/// The `UserModel` class represents a model for a user.
///
/// It extends the `UserEntity` class.
class UserModel extends UserEntity {
  /// Creates a new instance of the `UserModel` class.
  ///
  /// The [id], [name], and [email] parameters are required and represent the user information.
  /// The [role] and [image] parameters are optional.
  const UserModel({
    required int id,
    required String name,
    required String email,
    String? role,
    String? image,
  }) : super(
          id: id,
          name: name,
          email: email,
          role: role,
          image: image,
        );

  /// Creates a new instance of the `UserModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the user information.
  /// The keys 'id', 'name', 'email', 'role', and 'image' are used to extract the corresponding values.
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        role: json['role'],
        image: json['image'],
      );

  /// Creates a new instance of the `UserModel` class from a `UserEntity` instance.
  ///
  /// The [user] parameter is a `UserEntity` instance from which to create the `UserModel`.
  factory UserModel.fromEntity(UserEntity user) => UserModel(
        id: user.id,
        name: user.name,
        email: user.email,
        role: user.role,
        image: user.image,
      );

  /// Returns a list of properties used for value comparison.
  @override
  List<Object?> get props => [id, name, email, role, image];

  /// Specifies whether the object should be stringified.
  @override
  bool get stringify => true;
}

/// The `UserModelX` extension provides JSON serialization capabilities for `UserEntity`.
extension UserModelX on UserEntity {
  /// Converts the `UserEntity` instance to a JSON map.
  ///
  /// Returns a JSON map representation of the `UserEntity` instance.
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'role': role,
        'image': image,
      };
}
