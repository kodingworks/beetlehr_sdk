import 'package:beetlehr_sdk/src/failures/failures.dart';

/// The `CodeFailure` class represents a failure with an error code.
///
/// It extends the `Failure` class.
class CodeFailure extends Failure {
  /// Creates a new instance of the `CodeFailure` class.
  ///
  /// The [message] parameter is required and represents the error message.
  /// The [code] parameter is optional and represents the error code.
  const CodeFailure({required String message, Object? code})
      : super(message: message, code: code);
}
