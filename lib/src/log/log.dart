import "package:log_tanker/src/log/log_categories.dart";

/// The `Log` class for creating and managing log entries.
///
/// Stores information such as log messages, stack traces, timestamps, and log categories.
class Log {
  /// The main message of the log entry.
  final String message;

  /// Stack trace associated with the log entry.
  final String stackTrace;

  /// Timestamp of the log creation, initialized to the current date and time.
  final DateTime time = DateTime.now();

  /// Category of the log entry, defaults to `infoLog`.
  final LogCategories category;

  /// Constructor for creating a log entry with the given message, stack trace, and category.
  Log({
    required this.message,
    required this.stackTrace,
    this.category = infoLog,
  });

  /// Converts the log entry to a JSON map.
  ///
  /// Returns a map containing the log's message, stack trace, timestamp, and category.
  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "stackTrace": stackTrace,
      "time": time.toIso8601String(),
      "category": category.name,
    };
  }
}
