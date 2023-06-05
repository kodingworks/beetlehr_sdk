import 'package:equatable/equatable.dart';

/// The UserEntity class represents a user entity with various properties.
///
/// This class extends the Equatable class, allowing for easy comparison of
/// UserEntity objects based on their properties.
class UserEntity extends Equatable {
  /// The unique identifier of the user.
  final int id;

  /// The name of the user.
  final String name;

  /// The email address of the user.
  final String email;

  /// The role of the user (optional).
  final String? role;

  /// The image URL of the user (optional).
  final String? image;

  /// Creates a new instance of the UserEntity class.
  ///
  /// The [id], [name], and [email] parameters are required, while the [role]
  /// and [image] parameters are optional.
  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.role,
    this.image,
  });

  /// Returns a list of properties that are used to determine equality
  /// between UserEntity objects.
  @override
  List<Object?> get props => [
        id,
        name,
        email,
        role,
        image,
      ];

  /// Returns whether the [toString] method should include all properties
  /// of the UserEntity class.
  @override
  bool get stringify => true;
}
