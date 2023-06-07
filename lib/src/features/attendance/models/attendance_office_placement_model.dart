import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:equatable/equatable.dart';

/// Model class representing the attendance office placement.
class AttendanceOfficePlacementModel extends Equatable {
  const AttendanceOfficePlacementModel({
    required this.address,
    required this.placementLatitude,
    required this.placementLongitude,
    required this.maxRadius,
    required this.accepted,
    required this.workingFrom,
  });

  final String address; // The address of the office placement
  final double placementLatitude; // The latitude of the office placement
  final double placementLongitude; // The longitude of the office placement
  final double maxRadius; // The maximum radius for office placement
  final bool accepted; // Flag indicating if the office placement is accepted
  final WorkingFromType
      workingFrom; // The working from type for the office placement

  /// Creates an instance of [AttendanceOfficePlacementModel] from JSON data.
  factory AttendanceOfficePlacementModel.fromJson(Map<String, dynamic> json) {
    return AttendanceOfficePlacementModel(
      address: json['address'],
      placementLatitude: double.parse(json['placement_latitude'] ?? '0'),
      placementLongitude: double.parse(json['placement_longitude'] ?? '0'),
      maxRadius: double.parse(json['max_radius'] ?? '0'),
      accepted: json['accepted'],
      workingFrom:
          workingFromTypeFromString(json['status']) ?? WorkingFromType.office,
    );
  }

  /// Converts the [AttendanceOfficePlacementModel] instance to JSON.
  Map<String, dynamic> toJson() => {
        'address': address,
        'placement_latitude': placementLatitude,
        'placement_longitude': placementLongitude,
        'max_radius': maxRadius,
        'accepted': accepted,
      };

  @override
  List<Object> get props => [
        address,
        placementLatitude,
        placementLongitude,
        maxRadius,
        accepted,
        workingFrom,
      ];
}
