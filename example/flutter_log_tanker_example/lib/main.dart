import 'package:flutter/material.dart';
import 'package:log_tanker/log_tanker.dart';

Logger myLogger = Logger(loggerName: "MyLogger");

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;

      QuickLog.v("Counter incremented to $_counter");
      QuickLog.d("Counter incremented to $_counter");
      QuickLog.i("Counter incremented to $_counter");
      QuickLog.w("Counter incremented to $_counter");

      // In debug mode, the following will trigger a debugger breakpoint
      QuickLog.ensure(_counter < 5, "Counter must be less than 5");

      myLogger.v("Counter incremented to $_counter");
      myLogger.d("Counter incremented to $_counter");
      myLogger.i("Counter incremented to $_counter");
      myLogger.w("Counter incremented to $_counter");

      // In debug mode, the following will trigger a debugger breakpoint
      myLogger.ensure(_counter < 5, "Counter must be less than 5");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
