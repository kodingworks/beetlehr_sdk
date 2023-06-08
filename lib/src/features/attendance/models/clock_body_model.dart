import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:equatable/equatable.dart';

/// The `ClockBodyModel` class represents a model for clocking in/out data.
///
/// This model contains various attributes related to clocking in/out,
/// such as the date, clock time, attendance type, notes, location coordinates,
/// image ID, address, overtime ID, file IDs, and working from type.
class ClockBodyModel extends Equatable {
  /// The date of the clock entry.
  final DateTime? date;

  /// The clock time of the clock entry.
  final String clock;

  /// The attendance type of the clock entry.
  final AttendanceType type;

  /// Additional notes for the clock entry.
  final String? notes;

  /// The latitude coordinate of the clock entry location.
  final double latitude;

  /// The longitude coordinate of the clock entry location.
  final double longitude;

  /// The ID of the clock entry image.
  final int imageId;

  /// The address of the clock entry location.
  final String address;

  /// The overtime ID associated with the clock entry.
  final int? overtimeId;

  /// The IDs of the files associated with the clock entry.
  final List<int>? filesId;

  /// The working from type of the clock entry.
  final WorkingFromType workingFrom;

  /// Creates a new instance of the `ClockBodyModel` class.
  ///
  /// The [date], [clock], [type], [latitude], [longitude], [imageId],
  /// [address], and [workingFrom] parameters are required, while
  /// [notes], [overtimeId], and [filesId] are optional.
  const ClockBodyModel({
    this.date,
    required this.clock,
    required this.type,
    this.notes,
    required this.latitude,
    required this.longitude,
    required this.imageId,
    required this.address,
    this.overtimeId,
    this.filesId,
    required this.workingFrom,
  });

  /// Creates a new instance of the `ClockBodyModel` class by copying the existing instance and overriding certain attributes.
  ///
  /// The [copyWith] method allows you to create a new `ClockBodyModel` instance by
  /// providing new values for specific attributes while keeping the rest unchanged.
  ClockBodyModel copyWith({
    DateTime? date,
    String? clock,
    AttendanceType? type,
    String? notes,
    double? latitude,
    double? longitude,
    int? imageId,
    String? address,
    int? overtimeId,
    List<int>? filesId,
    WorkingFromType? workingFrom,
  }) =>
      ClockBodyModel(
        date: date ?? this.date,
        clock: clock ?? this.clock,
        type: type ?? this.type,
        notes: notes ?? this.notes,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        imageId: imageId ?? this.imageId,
        address: address ?? this.address,
        overtimeId: overtimeId ?? this.overtimeId,
        filesId: filesId ?? this.filesId,
        workingFrom: workingFrom ?? this.workingFrom,
      );

  /// Converts the `ClockBodyModel` instance to a JSON map.
  ///
  /// Returns a JSON map representation of the `ClockBodyModel` instance.
  Map<String, dynamic> toJson() => {
        "date": date?.toIso8601String(),
        "clock": clock,
        "type": type.convertToString(),
        "notes": notes,
        "latitude": latitude.toString(),
        "longitude": longitude.toString(),
        "image_id": imageId,
        "address": address,
        'overtime_id': overtimeId,
        "files": filesId,
        'status': workingFrom.convertToString(),
      };

  /// Converts the `ClockBodyModel` instance to a JSON map without including file IDs.
  ///
  /// Returns a JSON map representation of the `ClockBodyModel` instance, excluding the file IDs.
  Map<String, dynamic> toJsonNoFiles() => {
        "date": date?.toIso8601String(),
        "clock": clock,
        "type": type.convertToString(),
        "notes": notes,
        "latitude": latitude.toString(),
        "longitude": longitude.toString(),
        "image_id": imageId,
        "address": address,
        'overtime_id': overtimeId,
        'status': workingFrom.convertToString(),
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
        overtimeId,
        filesId,
        workingFrom,
      ];

  @override
  bool get stringify => true;
}
