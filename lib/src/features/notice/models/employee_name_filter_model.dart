import 'package:equatable/equatable.dart';

/// The `EmployeeNameFilterModel` class represents an employee filtered by name.
///
/// It contains properties for the employee's ID, name, designation, placement, and image (optional).
/// This class implements the `Equatable` class to enable value comparison based on its properties.
class EmployeeNameFilterModel extends Equatable {
  /// Creates a new instance of the `EmployeeNameFilterModel` class.
  ///
  /// The [id], [name], [designation], and [placement] parameters are required.
  /// The [image] parameter is optional and represents the employee's image.
  const EmployeeNameFilterModel({
    required this.id,
    required this.name,
    required this.designation,
    required this.placement,
    this.image,
  });

  /// The ID of the employee.
  final int id;

  /// The name of the employee.
  final String name;

  /// The designation of the employee.
  final String designation;

  /// The placement of the employee.
  final String placement;

  /// The image associated with the employee (optional).
  final String? image;

  /// Creates a new instance of the `EmployeeNameFilterModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the employee data.
  /// The keys 'id', 'name', 'designation', 'placement', and 'image' are used to extract the corresponding values.
  factory EmployeeNameFilterModel.fromJson(Map<String, dynamic> json) {
    return EmployeeNameFilterModel(
      id: json['id'],
      name: json['name'],
      designation: json['designation'],
      placement: json['placement'],
      image: json['image'],
    );
  }

  @override
  List<Object?> get props => [id, name, designation, placement, image];
}
