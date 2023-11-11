import 'package:ansicolor/ansicolor.dart';
import 'package:log_tanker/src/log/log.dart';
import 'package:log_tanker/src/log/logger.dart';

class LogCategories {
  final String name;
  final String Function(Log, Logger) formatter;
  final bool mustBreakDebug;

  const LogCategories(
      {required this.name,
      required this.formatter,
      this.mustBreakDebug = false});
}

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

String formatVerbose(Log logObject, Logger logger) {
  final AnsiPen verbosePen = AnsiPen()..gray();
  return verbosePen(formatBasicLog(logObject, logger));
}

String formatDebug(Log logObject, Logger logger) {
  final AnsiPen debugPen = AnsiPen()..blue();
  return debugPen(formatBasicLog(logObject, logger));
}

String formatInfo(Log logObject, Logger logger) {
  final AnsiPen infoPen = AnsiPen()..green();
  return infoPen(formatBasicLog(logObject, logger));
}

String formatWarning(Log logObject, Logger logger) {
  final AnsiPen warningPen = AnsiPen()..yellow();
  return warningPen(formatBasicLog(logObject, logger));
}

String formatError(Log logObject, Logger logger) {
  final AnsiPen errorPen = AnsiPen()..red();
  return errorPen(formatBasicLog(logObject, logger));
}

String formatEnsure(Log logObject, Logger logger) {
  final AnsiPen ensurePen = AnsiPen()..red();
  return ensurePen(formatBasicLog(logObject, logger));
}

const verboseLog = LogCategories(name: "verbose", formatter: formatVerbose);
const debugLog = LogCategories(name: "debug", formatter: formatDebug);
const infoLog = LogCategories(name: "info", formatter: formatInfo);
const warningLog = LogCategories(name: "warning", formatter: formatWarning);
const errorLog =
    LogCategories(name: "error", formatter: formatError, mustBreakDebug: true);
const ensureLog = LogCategories(name: "ensure", formatter: formatEnsure);
