import "package:ansicolor/ansicolor.dart";
import "package:log_tanker/src/log/log.dart";
import "package:log_tanker/src/log/logger.dart";

/// Class representing log categories with custom formatting and behaviors.
class LogCategories {
  /// The name of the log category.
  final String name;

  /// A function defining how logs in this category are formatted.
  /// It takes a `Log` and `Logger` object and returns a formatted string.
  final String Function(Log, Logger) formatter;

  /// Indicates if the log should trigger a breakpoint in debug mode.
  final bool mustBreakDebug;

  /// Constructor for creating a log category.
  const LogCategories(
      {required this.name,
      required this.formatter,
      this.mustBreakDebug = false});
}

/// Formats the log in a basic string format.
String formatBasicLog(Log logObject, Logger logger) {
  final String time = logObject.time.toIso8601String();
  final String level = logObject.category.name;
  final String message = logObject.message;

  String logString = "[$time ${logger.loggerName} $level] : $message";

  if (logObject.stackTrace.isNotEmpty) {
    logString += "\n StackTrace => ${logObject.stackTrace}";
  }

  return logString;
}

/// Formats the log with verbose style.
String formatVerbose(Log logObject, Logger logger) {
  final AnsiPen verbosePen = AnsiPen();
  return verbosePen(formatBasicLog(logObject, logger));
}

/// Formats the log with debug style.
String formatDebug(Log logObject, Logger logger) {
  final AnsiPen debugPen = AnsiPen()..blue();
  return debugPen(formatBasicLog(logObject, logger));
}

/// Formats the log with info style.
String formatInfo(Log logObject, Logger logger) {
  final AnsiPen infoPen = AnsiPen()..green();
  return infoPen(formatBasicLog(logObject, logger));
}

/// Formats the log with warning style.
String formatWarning(Log logObject, Logger logger) {
  final AnsiPen warningPen = AnsiPen()..yellow();
  return warningPen(formatBasicLog(logObject, logger));
}

/// Formats the log with error style.
String formatError(Log logObject, Logger logger) {
  final AnsiPen errorPen = AnsiPen()..red();
  return errorPen(formatBasicLog(logObject, logger));
}

/// Formats the log with ensure style.
String formatEnsure(Log logObject, Logger logger) {
  final AnsiPen ensurePen = AnsiPen()..red();
  return ensurePen(formatBasicLog(logObject, logger));
}

// Definitions of various log categories with associated formatting functions.
const verboseLog = LogCategories(name: "verbose", formatter: formatVerbose);
const debugLog = LogCategories(name: "debug", formatter: formatDebug);
const infoLog = LogCategories(name: "info", formatter: formatInfo);
const warningLog = LogCategories(name: "warning", formatter: formatWarning);
const errorLog =
    LogCategories(name: "error", formatter: formatError, mustBreakDebug: true);
const ensureLog = LogCategories(name: "ensure", formatter: formatEnsure);
