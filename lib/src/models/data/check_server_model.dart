import 'package:beetlehr_sdk/src/entities/entities.dart';

/// The `CheckServerModel` class represents a model for checking server information.
///
/// It extends the `ServerEntity` class.
class CheckServerModel extends ServerEntity {
  /// Creates a new instance of the `CheckServerModel` class.
  ///
  /// The [name], [url], [logo], and [status] parameters are required and represent the server information.
  const CheckServerModel({
    required String name,
    required String url,
    required String logo,
    required String status,
  }) : super(name: name, url: url, logo: logo, status: status);

  /// Creates a new instance of the `CheckServerModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the server information.
  /// The keys 'name', 'url', 'logo', and 'status' are used to extract the corresponding values.
  factory CheckServerModel.fromJson(Map<String, dynamic> json) {
    return CheckServerModel(
      name: json['name'] ?? '',
      url: json['url'] ?? '',
      logo: json['logo'] ?? '',
      status: json['status'] ?? '',
    );
  }
}

/// The `CheckServerModelX` extension provides JSON serialization capabilities for `ServerEntity`.
extension CheckServerModelX on ServerEntity {
  /// Converts the `ServerEntity` instance to a JSON map.
  ///
  /// Returns a JSON map representation of the `ServerEntity` instance.
  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
        'logo': logo,
        'status': status,
      };
}
