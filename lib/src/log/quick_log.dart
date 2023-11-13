import "package:log_tanker/src/log/log_categories.dart";
import "package:log_tanker/src/log/logger.dart";

abstract final class QuickLog {
  static final Logger _quickLogger = Logger(loggerName: "QuickLog");

  static Logger get getQuickLogger => _quickLogger;

  static void log(String message, LogCategories category,
          {String stackTrace = ""}) =>
      getQuickLogger.log(message, category, stackTrace: stackTrace);

  static void v(String message, {String stackTrace = ""}) =>
      getQuickLogger.v(message, stackTrace: stackTrace);

  static void i(String message, {String stackTrace = ""}) =>
      getQuickLogger.i(message, stackTrace: stackTrace);

  static void w(String message, {String stackTrace = ""}) =>
      getQuickLogger.w(message, stackTrace: stackTrace);

  static void e(String message, {String stackTrace = ""}) =>
      getQuickLogger.e(message, stackTrace: stackTrace);

  static bool ensure(bool condition, String message,
          {LogCategories category = ensureLog}) =>
      getQuickLogger.ensure(condition, message, category: category);

  static void d(String message, {String stackTrace = ""}) =>
      getQuickLogger.d(message, stackTrace: stackTrace);
}
