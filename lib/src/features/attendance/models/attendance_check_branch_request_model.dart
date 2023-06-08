import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:equatable/equatable.dart';

/// Model class representing the request for checking the Branch of the office.
class AttendanceCheckBranchRequestModel extends Equatable {
  final double latitude; // Latitude of the current location
  final double longitude; // Longitude of the current location
  final WorkingFromType workingFrom; // Working from type

  const AttendanceCheckBranchRequestModel({
    required this.latitude,
    required this.longitude,
    required this.workingFrom,
  });

  /// Converts the [AttendanceCheckBranchRequestModel] instance to JSON.
  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
        'status': workingFrom.convertToString(),
      };

  @override
  List<Object> get props => [latitude, longitude, workingFrom];
}
