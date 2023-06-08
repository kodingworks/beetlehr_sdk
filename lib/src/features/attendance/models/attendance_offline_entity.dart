import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:equatable/equatable.dart';

/// The AttendanceOfflineEntity class represents an entity for offline attendance data.
///
/// This entity contains information about an attendance entry, including the date, clock time,
/// attendance clock type, working from type, notes, geographical location (latitude and longitude),
/// image ID, local image path, and sync status.
///
/// This class extends the Equatable class to enable easy comparison and equality checks.
class AttendanceOfflineEntity extends Equatable {
  /// The date of the attendance entry.
  final DateTime date;

  /// The clock time of the attendance entry.
  final String clock;

  /// The type of attendance clock (e.g., clock-in, clock-out).
  final AttendanceClockType type;

  /// The working from type.
  final WorkingFromType workFrom;

  /// Additional notes or comments about the attendance entry.
  final String notes;

  /// The latitude of the geographical location where the attendance was recorded.
  final double latitude;

  /// The longitude of the geographical location where the attendance was recorded.
  final double longitude;

  /// The ID of the associated image.
  final int? imageId;

  /// The local path of the associated image.
  final String? localImage;

  /// Indicates whether the attendance entry has been synced.
  final bool isSynced;

  /// Creates a new instance of the AttendanceOfflineEntity class.
  ///
  /// The [date], [clock], [type], [workFrom], [notes], [latitude], [longitude], and [localImage] parameters are required.
  /// The [imageId] and [isSynced] parameters are optional and default to null and false, respectively.
  const AttendanceOfflineEntity({
    required this.date,
    required this.clock,
    required this.type,
    required this.workFrom,
    required this.notes,
    required this.latitude,
    required this.longitude,
    this.imageId,
    required this.localImage,
    this.isSynced = false,
  });

  /// Creates a new instance of the AttendanceOfflineEntity class by copying the existing entity with updated values.
  ///
  /// Returns a new AttendanceOfflineEntity instance with the specified parameters updated.
  AttendanceOfflineEntity copyWith({
    DateTime? date,
    String? clock,
    AttendanceClockType? type,
    WorkingFromType? workFrom,
    String? notes,
    double? latitude,
    double? longitude,
    int? imageId,
    String? localImage,
    bool? isSynced,
  }) {
    return AttendanceOfflineEntity(
      date: date ?? this.date,
      clock: clock ?? this.clock,
      type: type ?? this.type,
      workFrom: workFrom ?? this.workFrom,
      notes: notes ?? this.notes,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      imageId: imageId ?? this.imageId,
      localImage: localImage ?? this.localImage,
      isSynced: isSynced ?? this.isSynced,
    );
  }

  /// Converts the AttendanceOfflineEntity instance to a JSON map.
  ///
  /// Returns a JSON map representation of the AttendanceOfflineEntity instance.
  Map<String, dynamic> toJson() => {
        'date': date.toIso8601String(),
        'type': type.convertToString(),
        'clock': clock,
        'status': workFrom.convertToString(),
        'notes': notes,
        'latitude': latitude.toString(),
        'longitude': longitude.toString(),
        'local_image': localImage,
        'isSynced': isSynced,
        'image_id': imageId,
      };

  @override
  List<Object?> get props => [
        date,
        clock,
        type,
        workFrom,
        notes,
        latitude,
        longitude,
        imageId,
        localImage,
        isSynced
      ];
}
