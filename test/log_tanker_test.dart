import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:log_tanker/log_tanker.dart';

void main() {
  group("Simple test", () {
    test('Add verbose log', () {
      QuickLog.v("Verbose log");

      expect(Logger.getGlobalLogList.length, equals(1));

      expect(Logger.getGlobalLogList.last.category, equals(verboseLog));

      expect(Logger.getGlobalLogList.last.message, equals("Verbose log"));

      expect(Logger.getGlobalLogList.last.time.microsecondsSinceEpoch,
          lessThan(DateTime.now().microsecondsSinceEpoch));
    });

    test('Add debug log', () {
      QuickLog.d("Debug log");

      expect(Logger.getGlobalLogList.length, equals(2));

      expect(Logger.getGlobalLogList.last.category, equals(debugLog));

      expect(Logger.getGlobalLogList.last.message, equals("Debug log"));

      expect(Logger.getGlobalLogList.last.time.microsecondsSinceEpoch,
          lessThan(DateTime.now().microsecondsSinceEpoch));
    });

    test('Add info log', () {
      QuickLog.i("Info log");

      expect(Logger.getGlobalLogList.length, equals(3));

      expect(Logger.getGlobalLogList.last.category, equals(infoLog));

      expect(Logger.getGlobalLogList.last.message, equals("Info log"));

      expect(Logger.getGlobalLogList.last.time.microsecondsSinceEpoch,
          lessThan(DateTime.now().microsecondsSinceEpoch));
    });

    test('Add warning log', () {
      QuickLog.w("Warning log");

      expect(Logger.getGlobalLogList.length, equals(4));

      expect(Logger.getGlobalLogList.last.category, equals(warningLog));

      expect(Logger.getGlobalLogList.last.message, equals("Warning log"));

      expect(Logger.getGlobalLogList.last.time.microsecondsSinceEpoch,
          lessThan(DateTime.now().microsecondsSinceEpoch));
    });

    test('Add error log', () {
      QuickLog.e("Error log");

      expect(Logger.getGlobalLogList.length, equals(5));

      expect(Logger.getGlobalLogList.last.category, equals(errorLog));

      expect(Logger.getGlobalLogList.last.message, equals("Error log"));

      expect(Logger.getGlobalLogList.last.time.microsecondsSinceEpoch,
          lessThan(DateTime.now().microsecondsSinceEpoch));
    });

    test('Ensure true is true', () {
      QuickLog.ensure(true, message: "Ensure true");

      expect(Logger.getGlobalLogList.length, equals(5));
    });

    test('Ensure false is false', () {
      QuickLog.ensure(false, message: "Ensure false");

      expect(Logger.getGlobalLogList.length, equals(6));

      expect(Logger.getGlobalLogList.last.category, equals(ensureLog));

      expect(Logger.getGlobalLogList.last.message, equals("Ensure false"));

      expect(Logger.getGlobalLogList.last.time.microsecondsSinceEpoch,
          lessThan(DateTime.now().microsecondsSinceEpoch));
    });
  });

  group("Log To Json", () {
    test('Log to json', () {
      final String json = Logger.getLogDataBaseToJson();
      debugPrint(json);
    });
  });
}
