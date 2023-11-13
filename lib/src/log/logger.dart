import "dart:convert";
import "dart:developer";

import "package:ansicolor/ansicolor.dart";
import "package:log_tanker/src/log/log.dart";
import "package:log_tanker/src/log/log_categories.dart";

class Logger {
  final String loggerName;
  final List<Log> _logList = [];

  static final List<Log> _globalLogList = [];

  Logger({required this.loggerName}) {
    ansiColorDisabled = false;
  }

  static List<Log> get getGlobalLogList => _globalLogList;

  static String getLogDataBaseToJson() {
    return const JsonEncoder.withIndent("  ")
        .convert(getGlobalLogList.map((e) => e.toJson()).toList());
  }

  static String getLogDataBaseToFile() {
    String logDataBase = "";
    for (final Log log in getGlobalLogList) {
      logDataBase += "[${log.time} ${log.category.name}] : ${log.message}\n";
    }
    return logDataBase;
  }

  /// Log a message with your own [category] to the console.
  /// Prefer to use the [v], [d], [i], [w], [e] methods.
  void log(String message, LogCategories category, {String stackTrace = ""}) {
    final Log logMetaData = Log(
      message: message,
      stackTrace: stackTrace,
      category: category,
    );

    _globalLogList.add(logMetaData);
    _logList.add(logMetaData);

    print(logMetaData.category.formatter(logMetaData, this));
    debugger(
        when: logMetaData.category.mustBreakDebug,
        message: logMetaData.message);
  }

  /// Log a [verboseLog] message to the console.
  void v(String message, {String stackTrace = ""}) {
    log(message, verboseLog, stackTrace: stackTrace);
  }

  /// Log an [infoLog] message to the console.
  void i(String message, {String stackTrace = ""}) {
    log(message, infoLog, stackTrace: stackTrace);
  }

  /// Log a [warningLog] message to the console.
  void w(String message, {String stackTrace = ""}) {
    log(message, warningLog, stackTrace: stackTrace);
  }

  /// Log an [errorLog] message to the console.
  void e(String message, {String stackTrace = ""}) {
    log(message, errorLog, stackTrace: stackTrace);
  }

  /// TODO: Add documentation
  bool ensure(
    bool condition,
    String message, {
    String stackTrace = "",
    LogCategories category = ensureLog,
  }) {
    if (!condition) {
      log(message, category);
      debugger(message: message);
    }
    return condition;
  }

  /// Log a [debugLog] message to the console.
  /// The must be use to do log during development. It will be removed in production.
  void d(String message, {String stackTrace = ""}) {
    log(message, debugLog, stackTrace: stackTrace);
  }

  /// Use to allow the logger to be called as a function. It will call the [d] method.
  void call(String message, {String stackTrace = ""}) =>
      d(message, stackTrace: stackTrace);
}
