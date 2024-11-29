import 'package:flutter/material.dart';

// Main application entry point
void main() {
  runApp(MyStatefulApp());
}

// Stateful Widget Class
class MyStatefulApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterWidget(),
    );
  }
}

// Counter Stateful Widget
class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

// State Class for CounterWidget
class _CounterWidgetState extends State<CounterWidget> {
  // State variable to track the counter value
  int _counter = 0;

  // Method to increment the counter
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Method to decrement the counter
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Stateful Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter Value:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}