import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:equatable/equatable.dart';

class AttendanceCheckPlacementRequestModel extends Equatable {
  final double latitude;
  final double longitude;
  final WorkingFromType workingFrom;

  const AttendanceCheckPlacementRequestModel({
    required this.latitude,
    required this.longitude,
    required this.workingFrom,
  });

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
        'status': workingFrom.convertToString(),
      };

  @override
  List<Object> get props => [latitude, longitude, workingFrom];
}
