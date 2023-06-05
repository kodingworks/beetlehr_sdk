import 'package:equatable/equatable.dart';

/// The `Failure` class is an abstract class that represents a failure or error.
///
/// It extends the `Equatable` class to provide value comparison capabilities.
abstract class Failure extends Equatable {
  /// The error message associated with the failure.
  final String message;

  /// The error code associated with the failure (optional).
  final Object? code;

  /// The error code associated with the failure as a string (optional).
  final String? errorCode;

  /// Creates a new instance of the `Failure` class.
  ///
  /// The [message] parameter is required, while the [code] and [errorCode] parameters are optional.
  const Failure({
    required this.message,
    this.code,
    this.errorCode,
  });

  /// Returns a list of properties used for value comparison.
  @override
  List<Object?> get props => [message, code, errorCode];
}
