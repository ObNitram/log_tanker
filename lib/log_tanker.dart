/// The [log_tanker] Library
///
/// # Overview:
/// The [log_tanker] library is a comprehensive logging solution designed for Dart applications.
/// It provides a robust set of tools for managing and outputting log entries, facilitating
/// easy tracking and debugging of code. This library offers a range of functionalities, from
/// basic logging to advanced features like custom log categories and quick logging methods.
///
/// # Features:
/// - [Log]: A class for creating and managing log entries.
/// - [LogCategories]: Manages different log categories with associated formatting, including
///   predefined categories like verbose, debug, info, warning, error, and ensure.
/// - [Logger]: The core class responsible for the logging logic, offering various levels and methods.
/// - [QuickLog]: Provides static methods for quick and convenient logging without needing to instantiate
///   a Logger object.
///
/// # Example:
/// ```dart
/// import 'package:log_tanker/log_tanker.dart';
///
/// void main() {
///   var logger = Logger(loggerName: 'MyLogger');
///   logger.i('This is an info log');
///   logger.e('This is an error log');
/// }
/// ```
library log_tanker;

/// Exports the [Log] class from [log.dart].
/// This class is used for creating and managing log entries.
export "package:log_tanker/src/log/log.dart" show Log;
/// Exports the [LogCategories] class and various log category constants
/// like [verboseLog], [debugLog], [infoLog], [warningLog], [errorLog], [ensureLog]
/// from [log_categories.dart].
/// These are used to categorize and format log entries.
export "package:log_tanker/src/log/log_categories.dart"
    show
        LogCategories,
        verboseLog,
        debugLog,
        infoLog,
        warningLog,
        errorLog,
        ensureLog;
/// Exports the [Logger] class from [logger.dart].
/// This class is responsible for the actual logging logic, managing log entries,
/// and providing various logging levels or methods.
export "package:log_tanker/src/log/logger.dart" show Logger;
/// Exports the [QuickLog] class from [quick_log.dart].
/// This class offers static methods for quick logging without needing
/// to instantiate a Logger object.
export "package:log_tanker/src/log/quick_log.dart" show QuickLog;
