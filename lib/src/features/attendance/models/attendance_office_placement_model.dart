import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:equatable/equatable.dart';

class AttendanceOfficePlacementModel extends Equatable {
  const AttendanceOfficePlacementModel({
    required this.address,
    required this.placementLatitude,
    required this.placementLongitude,
    required this.maxRadius,
    required this.accepted,
    required this.workingFrom,
  });

  final String address;
  final double placementLatitude;
  final double placementLongitude;
  final double maxRadius;
  final bool accepted;
  final WorkingFromType workingFrom;

  factory AttendanceOfficePlacementModel.fromJson(Map<String, dynamic> json) {
    return AttendanceOfficePlacementModel(
        address: json['address'],
        placementLatitude: double.parse(json['placement_latitude'] ?? '0'),
        placementLongitude: double.parse(json['placement_longitude'] ?? '0'),
        maxRadius: double.parse(json['max_radius'] ?? 0),
        accepted: json['accepted'],
        workingFrom: workingFromTypeFromString(json['status']) ??
            WorkingFromType.office);
  }

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
