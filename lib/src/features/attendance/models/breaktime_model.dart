import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:equatable/equatable.dart';

import 'attendance_image_model.dart';

/// Represents a model for break time information.
class BreakTimeModel extends Equatable {
  /// The unique identifier for the break time.
  final int id;

  /// The type of break time.
  final BreakTimeType? type;

  /// The image associated with the break time.
  final AttendanceImageModel? image;

  /// The latitude coordinate of the break time location.
  final double? latitude;

  /// The longitude coordinate of the break time location.
  final double? longitude;

  /// The address of the break time location.
  final String? address;

  /// Optional notes about the break time.
  final String? notes;

  /// List of file names associated with the break time.
  final List<String>? files;

  /// Constructs a [BreakTimeModel] object.
  ///
  /// The [id] parameter is required, while the rest are optional.
  const BreakTimeModel({
    required this.id,
    this.type,
    this.image,
    this.latitude,
    this.longitude,
    this.address,
    this.notes,
    this.files,
  });

  /// Constructs a [BreakTimeModel] object from a JSON representation.
  factory BreakTimeModel.fromJson(Map<String, dynamic> json) {
    return BreakTimeModel(
      id: json["id"],
      type: breakTimeTypefromString(json['type']),
      latitude: 0,
      longitude: 0,
      image: json["image"] != null
          ? AttendanceImageModel.fromJson(json["image"])
          : null,
      address: json["address"],
      files: json['files'] != null
          ? List<String>.from(json['files']).toList()
          : null,
      notes: json["notes"],
    );
  }

  /// Converts the [BreakTimeModel] object to a JSON representation.
  Map<String, dynamic> toJson() => {
        'id': address,
        'type': type,
        'image': image,
        'latitude': latitude,
        'longitude': longitude,
        'address': notes,
        'files': files,
      };

  @override
  List<Object?> get props =>
      [address, type, image, latitude, longitude, notes, files];
}
