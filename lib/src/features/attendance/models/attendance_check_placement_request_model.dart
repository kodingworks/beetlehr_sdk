import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:equatable/equatable.dart';

/// Model class representing the request for checking the placement of the office.
class AttendanceCheckPlacementRequestModel extends Equatable {
  final double latitude; // Latitude of the current location
  final double longitude; // Longitude of the current location
  final WorkingFromType workingFrom; // Working from type

  const AttendanceCheckPlacementRequestModel({
    required this.latitude,
    required this.longitude,
    required this.workingFrom,
  });

  /// Converts the [AttendanceCheckPlacementRequestModel] instance to JSON.
  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
        'status': workingFrom.convertToString(),
      };

  @override
  List<Object> get props => [latitude, longitude, workingFrom];
}
