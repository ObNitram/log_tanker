import "package:log_tanker/src/log/log_categories.dart";
import "package:log_tanker/src/log/logger.dart";

/// [QuickLog] is an abstract final class providing static logging methods.
/// It acts as a wrapper around a [Logger] instance for quick and easy logging.
abstract final class QuickLog {
  /// Internal [Logger] instance used for all [QuickLog] methods.
  static final Logger _quickLogger = Logger(loggerName: "QuickLog");

  /// Getter for the internal [Logger] instance.
  static Logger get getQuickLogger => _quickLogger;

  /// Log a message with your own [category] to the console.
  /// Prefer to use the [v], [d], [i], [w], [e] methods for include categories.
  static void log(String message, LogCategories category,
          {String stackTrace = ""}) =>
      getQuickLogger.log(message, category, stackTrace: stackTrace);

  /// Quick log a message using [Logger.v] function on the default [Logger] instance.
  static void v(String message, {String stackTrace = ""}) =>
      getQuickLogger.v(message, stackTrace: stackTrace);

  /// Quick log a message using [Logger.i] function on the default [Logger] instance.
  static void i(String message, {String stackTrace = ""}) =>
      getQuickLogger.i(message, stackTrace: stackTrace);

  /// Quick log a message using [Logger.w] function on the default [Logger] instance.
  static void w(String message, {String stackTrace = ""}) =>
      getQuickLogger.w(message, stackTrace: stackTrace);

  /// Quick log a message using [Logger.e] function on the default [Logger] instance.
  static void e(String message, {String stackTrace = ""}) =>
      getQuickLogger.e(message, stackTrace: stackTrace);

  /// Ensures a condition is true, otherwise logs a message.
  static bool ensure(bool condition, String message,
          {LogCategories category = ensureLog}) =>
      getQuickLogger.ensure(condition, message, category: category);

  /// Quick log a message using [Logger.d] function on the default [Logger] instance.
  /// The must be use to do log during development. It will be removed in production.
  static void d(String message, {String stackTrace = ""}) =>
      getQuickLogger.d(message, stackTrace: stackTrace);
}
