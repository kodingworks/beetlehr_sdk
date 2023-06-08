import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:equatable/equatable.dart';

/// Model class representing the attendance office Branch.
class AttendanceOfficeBranchModel extends Equatable {
  const AttendanceOfficeBranchModel({
    required this.address,
    required this.branchLatitude,
    required this.branchLongitude,
    required this.maxRadius,
    required this.accepted,
    required this.workingFrom,
  });

  final String address; // The address of the office Branch
  final double branchLatitude; // The latitude of the office Branch
  final double branchLongitude; // The longitude of the office Branch
  final double maxRadius; // The maximum radius for office Branch
  final bool accepted; // Flag indicating if the office Branch is accepted
  final WorkingFromType
      workingFrom; // The working from type for the office Branch

  /// Creates an instance of [AttendanceOfficeBranchModel] from JSON data.
  factory AttendanceOfficeBranchModel.fromJson(Map<String, dynamic> json) {
    return AttendanceOfficeBranchModel(
      address: json['address'],
      branchLatitude: double.parse(json['Branch_latitude'] ?? '0'),
      branchLongitude: double.parse(json['Branch_longitude'] ?? '0'),
      maxRadius: double.parse(json['max_radius'] ?? '0'),
      accepted: json['accepted'],
      workingFrom:
          workingFromTypeFromString(json['status']) ?? WorkingFromType.office,
    );
  }

  /// Converts the [AttendanceOfficeBranchModel] instance to JSON.
  Map<String, dynamic> toJson() => {
        'address': address,
        'Branch_latitude': branchLatitude,
        'Branch_longitude': branchLongitude,
        'max_radius': maxRadius,
        'accepted': accepted,
      };

  @override
  List<Object> get props => [
        address,
        branchLatitude,
        branchLongitude,
        maxRadius,
        accepted,
        workingFrom,
      ];
}
