import 'package:log_tanker/src/log/log_categories.dart';

class Log {
  final String message;
  final String stackTrace;
  final DateTime time = DateTime.now();
  final LogCategories category;

  Log({
    required this.message,
    required this.stackTrace,
    this.category = infoLog,
  });

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "stackTrace": stackTrace,
      "time": time.toIso8601String(),
      "category": category.name,
    };
  }
}
