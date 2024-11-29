import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ChangeNotifier class to manage state
class Counter with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  // Method to increment the counter
  void increment() {
    _counter++;
    notifyListeners(); // Notify all listeners about the change
  }

  // Method to decrement the counter
  void decrement() {
    _counter--;
    notifyListeners(); // Notify all listeners about the change
  }
}

void main() {
  runApp(
    // Provide the Counter model to the widget tree
    ChangeNotifierProvider(
      create: (context) => Counter(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Change Notifiers Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Listen to the Counter provider and rebuild when it changes
    final counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Change Notifiers Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter Value:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              '${counter.counter}', // Display the current counter value
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    counter.increment(); // Increment the counter when pressed
                  },
                  child: Text('Increment'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    counter.decrement(); // Decrement the counter when pressed
                  },
                  child: Text('Decrement'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
