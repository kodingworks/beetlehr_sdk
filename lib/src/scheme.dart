/// The `BaseUrlSchema` enum represents the schema of a base URL.
enum BaseUrlSchema {
  /// HTTP schema.
  http,

  /// HTTPS schema.
  https,
}

/// Extension methods for the `BaseUrlSchema` enum.
extension BaseUrlSchemaX on BaseUrlSchema {
  /// Converts the `BaseUrlSchema` enum value to a URL schema string.
  String toUrlSchema() {
    switch (this) {
      case BaseUrlSchema.http:
        return 'http';
      case BaseUrlSchema.https:
        return 'https';
    }
  }
}
