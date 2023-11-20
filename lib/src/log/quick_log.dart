import "package:log_tanker/src/log/log_categories.dart";
import "package:log_tanker/src/log/logger.dart";

/// `QuickLog` is an abstract final class providing static logging methods.
/// It acts as a wrapper around a `Logger` instance for quick and easy logging.
abstract final class QuickLog {
  /// Internal `Logger` instance used for all `QuickLog` methods.
  static final Logger _quickLogger = Logger(loggerName: "QuickLog");

  /// Getter for the internal `Logger` instance.
  static Logger get getQuickLogger => _quickLogger;

  /// Log a message with your own [category] to the console.
  /// Prefer to use the [v], [d], [i], [w], [e] methods for include categories.
  static void log(String message, LogCategories category,
          {String stackTrace = ""}) =>
      getQuickLogger.log(message, category, stackTrace: stackTrace);

  /// Logs a verbose message.
  static void v(String message, {String stackTrace = ""}) =>
      getQuickLogger.v(message, stackTrace: stackTrace);

  /// Logs an informational message.
  static void i(String message, {String stackTrace = ""}) =>
      getQuickLogger.i(message, stackTrace: stackTrace);

  /// Logs a warning message.
  static void w(String message, {String stackTrace = ""}) =>
      getQuickLogger.w(message, stackTrace: stackTrace);

  /// Logs an error message.
  static void e(String message, {String stackTrace = ""}) =>
      getQuickLogger.e(message, stackTrace: stackTrace);

  /// Ensures a condition is true, logging an error message if not.
  static bool ensure(bool condition, String message,
          {LogCategories category = ensureLog}) =>
      getQuickLogger.ensure(condition, message, category: category);

  /// Log a [debugLog] message to the console.
  /// The must be use to do log during development. It will be removed in production.
  static void d(String message, {String stackTrace = ""}) =>
      getQuickLogger.d(message, stackTrace: stackTrace);
}
