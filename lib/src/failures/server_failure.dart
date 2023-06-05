import 'package:beetlehr_sdk/src/failures/failures.dart';

/// The `ServerFailure` class represents a failure related to server operations.
///
/// It extends the `Failure` class.
class ServerFailure extends Failure {
  /// Creates a new instance of the `ServerFailure` class.
  ///
  /// The [message] parameter is required and represents the error message.
  /// The [code] parameter is optional and represents the error code.
  const ServerFailure({required String message, Object? code})
      : super(message: message, code: code);
}
