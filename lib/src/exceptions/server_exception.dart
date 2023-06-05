/// The ServerException class is an abstract class that represents a server-related exception.
///
/// This class implements the Exception interface.
abstract class ServerException implements Exception {
  /// The error message associated with the exception.
  final String message;

  /// The error code associated with the exception (optional).
  final Object? code;

  /// Creates a new instance of the ServerException class.
  ///
  /// The [message] parameter is required, while the [code] parameter is optional.
  const ServerException({required this.message, this.code});
}

/// The GeneralServerException class represents a general server exception.
///
/// It extends the ServerException class.
class GeneralServerException extends ServerException {
  /// Creates a new instance of the GeneralServerException class.
  ///
  /// The [message] parameter is required, while the [code] parameter is optional.
  const GeneralServerException({
    required String message,
    Object? code,
  }) : super(
          message: message,
          code: code,
        );

  /// Returns a string representation of the GeneralServerException instance.
  @override
  String toString() => 'GeneralServerException(message: $message, code: $code)';
}

/// The TimeOutServerException class represents a server timeout exception.
///
/// It extends the ServerException class.
class TimeOutServerException extends ServerException {
  /// Creates a new instance of the TimeOutServerException class.
  ///
  /// The [message] parameter is required, while the [code] parameter is optional.
  const TimeOutServerException({
    required String message,
    Object? code,
  }) : super(
          message: message,
          code: code,
        );

  /// Returns a string representation of the TimeOutServerException instance.
  @override
  String toString() => 'TimeOutServerException(message: $message, code: $code)';
}

/// The NotFoundServerException class represents a server not found exception.
///
/// It extends the ServerException class.
class NotFoundServerException extends ServerException {
  /// Creates a new instance of the NotFoundServerException class.
  ///
  /// The [message] parameter is required, while the [code] parameter is optional.
  const NotFoundServerException({
    required String message,
    Object? code,
  }) : super(
          message: message,
          code: code,
        );

  /// Returns a string representation of the NotFoundServerException instance.
  @override
  String toString() =>
      'NotFoundServerException(message: $message, code: $code)';
}

/// The UnAuthenticationServerException class represents a server unauthenticated exception.
///
/// It extends the ServerException class.
class UnAuthenticationServerException extends ServerException {
  /// Creates a new instance of the UnAuthenticationServerException class.
  ///
  /// The [message] parameter is required, while the [code] parameter is optional.
  const UnAuthenticationServerException({
    required String message,
    Object? code,
  }) : super(
          message: message,
          code: code,
        );

  /// Returns a string representation of the UnAuthenticationServerException instance.
  @override
  String toString() =>
      'UnAuthenticationServerException(message: $message, code: $code)';
}

/// The UnAuthorizeServerException class represents a server unauthorized exception.
///
/// It extends the ServerException class.
class UnAuthorizeServerException extends ServerException {
  /// Creates a new instance of the UnAuthorizeServerException class.
  ///
  /// The [message] parameter is required, while the [code] parameter is optional.
  const UnAuthorizeServerException({
    required String message,
    Object? code,
  }) : super(
          message: message,
          code: code,
        );

  /// Returns a string representation of the UnAuthorizeServerException instance.
  @override
  String toString() =>
      'UnAuthorizeServerException(message: $message, code: $code)';
}

/// The InternalServerException class represents a server internal error exception.
///
/// It extends the ServerException class.
class InternalServerException extends ServerException {
  /// Creates a new instance of the InternalServerException class.
  ///
  /// The [message] parameter is required, while the [code] parameter is optional.
  const InternalServerException({
    required String message,
    Object? code,
  }) : super(
          message: message,
          code: code,
        );

  /// Returns a string representation of the InternalServerException instance.
  @override
  String toString() =>
      'InternalServerException(message: $message, code: $code)';
}
