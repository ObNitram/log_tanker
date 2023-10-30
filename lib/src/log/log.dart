import 'package:log_tanker/src/log/log_categories.dart';

class Log {
  final String message;
  final DateTime time = DateTime.now();
  final LogCategories category;

  Log({required this.message, this.category = infoLog});

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "time": time.toIso8601String(),
      "category": category.name,
    };
  }
}
