import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // Wrap the app with the ChangeNotifierProvider to make the counter available to the entire app
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: const MyApp(),
    ),
  );
}

// Main App Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider State Management',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

// Home Screen with Counter UI
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Using Consumer to listen to changes in the CounterModel
            Consumer<CounterModel>(
              builder: (context, counter, child) {
                return Text(
                  'Counter Value: ${counter.count}',
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Increment button
                ElevatedButton(
                  onPressed: () {
                    // Calling the increment method on CounterModel
                    context.read<CounterModel>().increment();
                  },
                  child: const Text('Increment'),
                ),
                const SizedBox(width: 20),
                // Decrement button
                ElevatedButton(
                  onPressed: () {
                    // Calling the decrement method on CounterModel
                    context.read<CounterModel>().decrement();
                  },
                  child: const Text('Decrement'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Model class to hold the counter value and notify listeners
class CounterModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  // Method to increment the counter
  void increment() {
    _count++;
    notifyListeners(); // Notifies all listeners when the value changes
  }

  // Method to decrement the counter
  void decrement() {
    _count--;
    notifyListeners(); // Notifies all listeners when the value changes
  }
}
