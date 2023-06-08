import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:equatable/equatable.dart';

/// Represents a model for break time information.
class BreakTimeBodyModel extends Equatable {
  /// Represents the date of the break time.
  final String date;

  /// Represents the clock time of the break.
  final String clock;

  /// Represents the type of break time.
  final BreakTimeType type;

  /// Optional notes about the break time.
  final String? notes;

  /// The latitude coordinate of the break time location.
  final String? latitude;

  /// The longitude coordinate of the break time location.
  final String? longitude;

  /// The ID of the image associated with the break time.
  final int? imageId;

  /// The address of the break time location.
  final String? address;

  /// List of file names associated with the break time.
  final List<String>? files;

  /// Constructs a [BreakTimeBodyModel] object.
  ///
  /// The [date], [clock], and [type] parameters are required.
  /// The [notes], [latitude], [longitude], [imageId], [address], and [files] parameters are optional.
  const BreakTimeBodyModel({
    required this.date,
    required this.clock,
    required this.type,
    this.notes,
    this.latitude,
    this.longitude,
    this.imageId,
    this.address,
    this.files,
  });

  /// Converts the [BreakTimeBodyModel] object to a JSON representation.
  Map<String, dynamic> toJson() => {
        "date": date,
        "clock": clock,
        "type": type.convertToString(),
        "notes": notes,
        "latitude": latitude,
        "longitude": longitude,
        "image_id": imageId,
        "address": address,
        "files": files,
      };

  @override
  List<Object?> get props => [
        date,
        clock,
        type,
        notes,
        latitude,
        longitude,
        imageId,
        address,
        files,
      ];

  @override
  bool get stringify => true;
}
