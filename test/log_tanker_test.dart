import 'package:log_tanker/log_tanker.dart';
import 'package:test/test.dart';

void main() {
  setUp(() => Logger.getGlobalLogList.clear());
  tearDown(() => Logger.getGlobalLogList.clear());

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

      expect(Logger.getGlobalLogList.length, equals(1));

      expect(Logger.getGlobalLogList.last.category, equals(debugLog));

      expect(Logger.getGlobalLogList.last.message, equals("Debug log"));

      expect(Logger.getGlobalLogList.last.time.microsecondsSinceEpoch,
          lessThan(DateTime.now().microsecondsSinceEpoch));
    });

    test('Add info log', () {
      QuickLog.i("Info log");

      expect(Logger.getGlobalLogList.length, equals(1));

      expect(Logger.getGlobalLogList.last.category, equals(infoLog));

      expect(Logger.getGlobalLogList.last.message, equals("Info log"));

      expect(Logger.getGlobalLogList.last.time.microsecondsSinceEpoch,
          lessThan(DateTime.now().microsecondsSinceEpoch));
    });

    test('Add warning log', () {
      QuickLog.w("Warning log");

      expect(Logger.getGlobalLogList.length, equals(1));

      expect(Logger.getGlobalLogList.last.category, equals(warningLog));

      expect(Logger.getGlobalLogList.last.message, equals("Warning log"));

      expect(Logger.getGlobalLogList.last.time.microsecondsSinceEpoch,
          lessThan(DateTime.now().microsecondsSinceEpoch));
    });

    test('Add error log', () {
      QuickLog.e("Error log");

      expect(Logger.getGlobalLogList.length, equals(1));

      expect(Logger.getGlobalLogList.last.category, equals(errorLog));

      expect(Logger.getGlobalLogList.last.message, equals("Error log"));

      expect(Logger.getGlobalLogList.last.time.microsecondsSinceEpoch,
          lessThan(DateTime.now().microsecondsSinceEpoch));
    },
        skip:
            "This test pass on local machine but not on github actions => debug stop execution");

    test('Ensure true is true', () {
      QuickLog.ensure(true, message: "Ensure true");

      expect(Logger.getGlobalLogList.length, equals(0));
    });

    test('Ensure false is false', () {
      QuickLog.ensure(false, message: "Ensure false");

      expect(Logger.getGlobalLogList.length, equals(1));

      expect(Logger.getGlobalLogList.last.category, equals(ensureLog));

      expect(Logger.getGlobalLogList.last.message, equals("Ensure false"));

      expect(Logger.getGlobalLogList.last.time.microsecondsSinceEpoch,
          lessThan(DateTime.now().microsecondsSinceEpoch));
    },
        skip:
            "This test pass on local machine but not on github actions => debug stop execution");
  });

  group("Log To Json", () {
    test('Log to json', () {
      QuickLog.v("Verbose log");
      QuickLog.d("Debug log");
      QuickLog.i("Info log");
      QuickLog.w("Warning log");

      final String json = Logger.getLogDataBaseToJson();

      expect(json.contains('"message":"Verbose log"'), isTrue);
      expect(json.contains('"message":"Debug log"'), isTrue);
      expect(json.contains('"message":"Info log"'), isTrue);
      expect(json.contains('"message":"Warning log"'), isTrue);

      expect(json.contains('"category":"verbose"'), isTrue);
      expect(json.contains('"category":"debug"'), isTrue);
      expect(json.contains('"category":"info"'), isTrue);
      expect(json.contains('"category":"warning"'), isTrue);
    });
  });
}
