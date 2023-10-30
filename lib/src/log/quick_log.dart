import 'package:log_tanker/src/log/log_categories.dart';
import 'package:log_tanker/src/log/logger.dart';

abstract final class QuickLog {
  static final Logger _quickLogger = Logger(loggerName: "QuickLog");

  static Logger get getQuickLogger => _quickLogger;

  static void log(String message, LogCategories category) =>
      getQuickLogger.log(message, category);

  static void v(String message) => getQuickLogger.v(message);

  static void d(String message) => getQuickLogger.d(message);

  static void i(String message) => getQuickLogger.i(message);

  static void w(String message) => getQuickLogger.w(message);

  static void e(String message) => getQuickLogger.e(message);

  static bool ensure(bool condition,
          {String message = "Ensure failed",
          LogCategories category = ensureLog}) =>
      getQuickLogger.ensure(condition, message: message, category: category);
}
