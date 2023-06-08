import 'package:equatable/equatable.dart';

/// The `ClockAcceptModel` class represents a model for clock acceptance.
///
/// This model contains information about the acceptance status of a clock entry,
/// including whether it is marked as late, whether the location is accepted, and
/// whether the image is accepted.
class ClockAcceptModel extends Equatable {
  /// Indicates whether the clock entry is marked as late.
  final bool? isLate;

  /// Indicates whether the location is accepted.
  final bool? acceptedLocation;

  /// Indicates whether the image is accepted.
  final bool? acceptedImage;

  /// Creates a new instance of the `ClockAcceptModel` class.
  ///
  /// The [isLate], [acceptedLocation], and [acceptedImage] parameters are optional and
  /// represent the acceptance status of the clock entry.
  const ClockAcceptModel({
    this.isLate,
    this.acceptedLocation,
    this.acceptedImage,
  });

  /// Creates a new instance of the `ClockAcceptModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the clock acceptance information.
  /// The keys in the JSON map are used to extract the corresponding values.
  factory ClockAcceptModel.fromJson(Map<String, dynamic> json) =>
      ClockAcceptModel(
        isLate: json['is_late'],
        acceptedLocation: json['accepted_location'],
        acceptedImage: json['accepted_image'],
      );

  /// Converts the `ClockAcceptModel` instance to a JSON map.
  ///
  /// Returns a JSON map representation of the `ClockAcceptModel` instance.
  Map<String, dynamic> toJson() => {
        'is_late': isLate,
        'accepted_location': acceptedLocation,
        'accepted_image': acceptedImage,
      };

  @override
  List<Object?> get props => [isLate, acceptedImage, acceptedLocation];

  @override
  bool? get stringify => true;
}
