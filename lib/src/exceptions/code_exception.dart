/// The ErrorCodeException class represents an exception with an error code.
///
/// This class implements the Exception interface.
class ErrorCodeException implements Exception {
  /// The error message associated with the exception.
  final String message;

  /// The error code associated with the exception (optional).
  final Object? code;

  /// Creates a new instance of the ErrorCodeException class.
  ///
  /// The [message] parameter is required, while the [code] parameter is optional.
  const ErrorCodeException({
    required this.message,
    this.code,
  });

  /// Returns a string representation of the ErrorCodeException instance.
  @override
  String toString() => 'ErrorCodeException(message: $message, code: $code)';
}
