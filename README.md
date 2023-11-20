<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
# Log Tanker
**Logging package for flutter and dart focused on very fast set up.
Entirely customizable and easy to use.**
<p align="center">
  <img src="https://github.com/ObNitram/log_tanker/blob/main/log_tanker.png?raw=true" width=50% height=50%>
</p>

## Features

<!--TODO: List what your package can do. Maybe include images, gifs, or videos.-->
- [x] Include **log** and **ensure** features
- [x] Right message on console or on integrated flutter dev tools
- [x] Error log and ensure are break point
- [x] Log with different categories and severity
- [x] Personalized log message for each category
- [x] Export log to json
- [x] Export log to file
- [ ] Listen all your log via stream 
- [ ] No cost for use in production
- [ ] Complete documentation
- [x] Complete api reference
- [ ] Complete example



## Getting Started with Log_Tanker
Utilize the QuickLog static class for rapid logging operations:
```dart
  setState(() {
    _counter++;

    QuickLog.v("Counter incremented to $_counter");
    QuickLog.d("Counter incremented to $_counter");
    QuickLog.i("Counter incremented to $_counter");
    QuickLog.w("Counter incremented to $_counter");
  });
```

For conditional logging and debugging, QuickLog offers the ensure method :
```dart
  setState(() {
    _counter++;

    // In debug mode, the following will trigger a debugger breakpoint
    QuickLog.ensure(_counter < 5, message: "Counter must be less than 5");
  });
```

For more personalized logging, instantiate your own Logger object :
```dart
  Logger myLogger = Logger(loggerName: "MyLogger");
  
  // ...
  
  setState(() {
    _counter++;
  
    // Use your custom logger
    myLogger.v("Counter incremented to $_counter"); // Verbose log
    myLogger.d("Counter incremented to $_counter"); // Debug log
    myLogger.i("Counter incremented to $_counter"); // Info log
    myLogger.w("Counter incremented to $_counter"); // Warning log
  
    // Triggers a debugger breakpoint in debug mode if the condition is false
    myLogger.ensure(_counter < 5, message: "Counter must be less than 5");
  });
```

## Project Example
For complete demonstrations, refer to the following examples:
- [flutter_log_tanker_example](./example/flutter_log_tanker_example)
<!-- - [dart_log_tanker_example](./example/dart_log_tanker_example) -->


## Additional Information
If you encounter any problems, feel free to create an [Issue](https://github.com/ObNitram/log_tanker/issues). You are also welcome to participate in [discussions](https://github.com/ObNitram/log_tanker/discussions) and contribute if you wish.
