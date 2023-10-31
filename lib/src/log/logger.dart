import 'dart:convert';
import 'dart:developer';

import 'package:ansicolor/ansicolor.dart';
import 'package:log_tanker/src/log/log.dart';
import 'package:log_tanker/src/log/log_categories.dart';

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

  void log(String message, LogCategories category) {
    final Log logMetaData = Log(message: message, category: category);
    _globalLogList.add(logMetaData);
    _logList.add(logMetaData);
    print(logMetaData.category.formatter(logMetaData, this));
    debugger(
        when: logMetaData.category.mustBreakDebug,
        message: logMetaData.message);
  }

  void call(String message, LogCategories category) => log(message, category);

  /// Log a [verboseLog] message to the console.
  void v(String message) {
    log(message, verboseLog);
  }

  /// Log a [debugLog] message to the console.
  void d(String message) {
    log(message, debugLog);
  }

  /// Log an [infoLog] message to the console.
  void i(String message) {
    log(message, infoLog);
  }

  /// Log a [warningLog] message to the console.
  void w(String message) {
    log(message, warningLog);
  }

  /// Log an [errorLog] message to the console.
  void e(String message) {
    log(message, errorLog);
  }

  bool ensure(bool condition,
      {String message = "Ensure failed", LogCategories category = ensureLog}) {
    if (!condition) {
      log(message, category);
      debugger(message: message);
    }
    return condition;
  }
}
