import 'package:beetlehr_sdk/src/models/models.dart';

import 'employee_name_filter_model.dart';

/// The `EmployeeNameFilterResponseModel` class represents a response model for employee name filtering.
///
/// It contains a list of `EmployeeNameFilterModel` objects and an optional `MetaData` object.
class EmployeeNameFilterResponseModel {
  /// The list of employee name filter data.
  final List<EmployeeNameFilterModel> data;

  /// Additional metadata associated with the employee name filter response (optional).
  final MetaData? meta;

  /// Creates a new instance of the `EmployeeNameFilterResponseModel` class.
  ///
  /// The [data] parameter is required and represents the list of employee name filter data.
  /// The [meta] parameter is optional and represents additional metadata associated with the response.
  EmployeeNameFilterResponseModel({
    required this.data,
    this.meta,
  });

  /// Creates a new instance of the `EmployeeNameFilterResponseModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the employee name filter response data.
  /// The keys 'data' and 'meta' are used to extract the corresponding values.
  factory EmployeeNameFilterResponseModel.fromJson(Map<String, dynamic> json) {
    return EmployeeNameFilterResponseModel(
      data: json['data'] != null
          ? List<EmployeeNameFilterModel>.from(
              json["data"].map((x) => EmployeeNameFilterModel.fromJson(x)))
          : [],
      meta: json['meta'] != null ? MetaData.fromJson(json['meta']) : null,
    );
  }
}
