import "package:log_tanker/log_tanker.dart";
import "package:test/test.dart";

void main() {
  setUp(() => Logger.getGlobalLogList.clear());
  tearDown(() => Logger.getGlobalLogList.clear());

  group("Simple test", () {
    test("Add verbose log", () {
      QuickLog.v("Verbose log");

      expect(Logger.getGlobalLogList.length, equals(1));

      expect(Logger.getGlobalLogList.last.category, equals(verboseLog));

      expect(Logger.getGlobalLogList.last.message, equals("Verbose log"));

      expect(Logger.getGlobalLogList.last.time.microsecondsSinceEpoch,
          lessThan(DateTime.now().microsecondsSinceEpoch));
    });

    test("Add info log", () {
      QuickLog.i("Info log");

      expect(Logger.getGlobalLogList.length, equals(1));

      expect(Logger.getGlobalLogList.last.category, equals(infoLog));

      expect(Logger.getGlobalLogList.last.message, equals("Info log"));

      expect(Logger.getGlobalLogList.last.time.microsecondsSinceEpoch,
          lessThan(DateTime.now().microsecondsSinceEpoch));
    });

    test("Add warning log", () {
      QuickLog.w("Warning log");

      expect(Logger.getGlobalLogList.length, equals(1));

      expect(Logger.getGlobalLogList.last.category, equals(warningLog));

      expect(Logger.getGlobalLogList.last.message, equals("Warning log"));

      expect(Logger.getGlobalLogList.last.time.microsecondsSinceEpoch,
          lessThan(DateTime.now().microsecondsSinceEpoch));
    });

    test("Add error log", () {
      QuickLog.e("Error log");

      expect(Logger.getGlobalLogList.length, equals(1));

      expect(Logger.getGlobalLogList.last.category, equals(errorLog));

      expect(Logger.getGlobalLogList.last.message, equals("Error log"));

      expect(Logger.getGlobalLogList.last.time.microsecondsSinceEpoch,
          lessThan(DateTime.now().microsecondsSinceEpoch));
    },
        skip:
            "This test pass on local machine but not on github actions => debug stop execution");

    test("Ensure true is true", () {
      QuickLog.ensure(true, "Ensure true");

      expect(Logger.getGlobalLogList.length, equals(0));
    });

    test(
      "Ensure false is false",
      () {
        QuickLog.ensure(false, "Ensure false");

        expect(Logger.getGlobalLogList.length, equals(1));

        expect(Logger.getGlobalLogList.last.category, equals(ensureLog));

        expect(Logger.getGlobalLogList.last.message, equals("Ensure false"));

        expect(Logger.getGlobalLogList.last.time.microsecondsSinceEpoch,
            lessThan(DateTime.now().microsecondsSinceEpoch));
      },
      skip:
          "This test pass on local machine but not on github actions => debug stop execution",
    );

    test("Add debug log", () {
      QuickLog.d("Debug log");

      expect(Logger.getGlobalLogList.length, equals(1));

      expect(Logger.getGlobalLogList.last.category, equals(debugLog));

      expect(Logger.getGlobalLogList.last.message, equals("Debug log"));

      expect(Logger.getGlobalLogList.last.time.microsecondsSinceEpoch,
          lessThan(DateTime.now().microsecondsSinceEpoch));
    });

    test("Add debug log with logger as a function", () {
      QuickLog.getQuickLogger("Debug log");

      expect(Logger.getGlobalLogList.length, equals(1));

      expect(Logger.getGlobalLogList.last.category, equals(debugLog));

      expect(Logger.getGlobalLogList.last.message, equals("Debug log"));

      expect(Logger.getGlobalLogList.last.time.microsecondsSinceEpoch,
          lessThan(DateTime.now().microsecondsSinceEpoch));
    });
  });

  group("Export log", () {
    group("to json", () {
      test("contains good message", () {
        QuickLog.v("Verbose log");
        QuickLog.d("Debug log");
        QuickLog.i("Info log");
        QuickLog.w("Warning log");

        final String json = Logger.getLogDataBaseToJson();

        expect(json, contains('"message": "Verbose log"'));
        expect(json, contains('"message": "Debug log"'));
        expect(json, contains('"message": "Info log"'));
        expect(json, contains('"message": "Warning log"'));
      });

      test("contains good category", () {
        QuickLog.v("Verbose log");
        QuickLog.d("Debug log");
        QuickLog.i("Info log");
        QuickLog.w("Warning log");

        final String json = Logger.getLogDataBaseToJson();

        expect(json, contains('"category": "verbose"'));
        expect(json, contains('"category": "debug"'));
        expect(json, contains('"category": "info"'));
        expect(json, contains('"category": "warning"'));
      });

      test("contains good time", () {
        QuickLog.v("Verbose log");

        final String json = Logger.getLogDataBaseToJson();

        expect(
            json,
            matches(RegExp(
                r'"time": "\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{6}"')));
      });

      test("contains good stack trace", () {
        QuickLog.v("Verbose log", stackTrace: "Stack trace1");
        QuickLog.d("Debug log", stackTrace: "Stack trace2");
        QuickLog.i("Info log", stackTrace: "Stack trace3");
        QuickLog.w("Warning log", stackTrace: "Stack trace4");

        final String json = Logger.getLogDataBaseToJson();

        expect(json, contains('"stackTrace": "Stack trace1"'));
        expect(json, contains('"stackTrace": "Stack trace2"'));
        expect(json, contains('"stackTrace": "Stack trace3"'));
        expect(json, contains('"stackTrace": "Stack trace4"'));
      });
    });

    test("to file", () {
      QuickLog.v("Verbose log");
      QuickLog.d("Debug log");
      QuickLog.i("Info log");
      QuickLog.w("Warning log");

      final String json = Logger.getLogDataBaseToFile();
      // print(json);

      expect(json.contains("Verbose log"), isTrue);
      expect(json.contains("Debug log"), isTrue);
      expect(json.contains("Info log"), isTrue);
      expect(json.contains("Warning log"), isTrue);

      expect(json.contains("verbose"), isTrue);
      expect(json.contains("debug"), isTrue);
      expect(json.contains("info"), isTrue);
      expect(json.contains("warning"), isTrue);
    });
  });

  group("Stack trace", () {
    test("Add stack trace", () {
      QuickLog.v("Verbose log", stackTrace: "Stack trace1");
      QuickLog.d("Debug log", stackTrace: "Stack trace2");
      QuickLog.i("Info log", stackTrace: "Stack trace3");
      QuickLog.w("Warning log", stackTrace: "Stack trace4");

      expect(Logger.getGlobalLogList.length, equals(4));

      expect(Logger.getGlobalLogList[0].stackTrace, equals("Stack trace1"));
      expect(Logger.getGlobalLogList[1].stackTrace, equals("Stack trace2"));
      expect(Logger.getGlobalLogList[2].stackTrace, equals("Stack trace3"));
      expect(Logger.getGlobalLogList[3].stackTrace, equals("Stack trace4"));
    });
  });
}
