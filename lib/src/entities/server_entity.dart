import 'package:equatable/equatable.dart';

/// The ServerEntity class represents a server entity with various properties.
///
/// This class extends the Equatable class, allowing for easy comparison of
/// ServerEntity objects based on their properties.
class ServerEntity extends Equatable {
  /// The name of the server.
  final String name;

  /// The URL of the server.
  final String url;

  /// The logo of the server.
  final String logo;

  /// The status of the server.
  final String status;

  /// Creates a new instance of the ServerEntity class.
  ///
  /// The [name], [url], [logo], and [status] parameters are required.
  const ServerEntity({
    required this.name,
    required this.url,
    required this.logo,
    required this.status,
  });

  /// Returns a list of properties that are used to determine equality
  /// between ServerEntity objects.
  @override
  List<Object?> get props => [
        name,
        url,
        logo,
        status,
      ];

  /// Returns whether the [toString] method should include all properties
  /// of the ServerEntity class.
  @override
  bool get stringify => true;
}
