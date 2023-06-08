import 'package:equatable/equatable.dart';

/// The TrackerConfigModel class represents a model for tracker configuration.
///
/// This model contains information about whether the tracker is enabled and the tracker URL.
///
/// This class extends the Equatable class to enable easy comparison and equality checks.
class TrackerConfigModel extends Equatable {
  /// Indicates whether the tracker is enabled.
  final bool isEnabled;

  /// The URL of the tracker.
  final String url;

  /// Creates a new instance of the TrackerConfigModel class.
  ///
  /// The [isEnabled] and [url] parameters are required.
  const TrackerConfigModel({
    required this.isEnabled,
    required this.url,
  });

  /// Creates a new instance of the TrackerConfigModel class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the tracker configuration.
  /// The keys in the JSON map are used to extract the corresponding values.
  factory TrackerConfigModel.fromJson(Map<String, dynamic> json) {
    return TrackerConfigModel(
      isEnabled: json['is_enabled'] ?? false,
      url: json['tracker_endpoint'] ?? '',
    );
  }

  /// Converts the TrackerConfigModel instance to a JSON map.
  ///
  /// Returns a JSON map representation of the TrackerConfigModel instance.
  Map<String, dynamic> toJson() {
    return {
      'is_enabled': isEnabled,
      'tracker_endpoint': url,
    };
  }

  @override
  List<Object?> get props => [isEnabled, url];
}
