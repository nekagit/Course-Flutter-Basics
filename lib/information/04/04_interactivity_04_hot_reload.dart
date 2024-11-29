import 'package:flutter/material.dart';

void main() {
  runApp(HotReloadDemoApp());
}

class HotReloadDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HotReloadDemoWidget(),
    );
  }
}

class HotReloadDemoWidget extends StatefulWidget {
  @override
  _HotReloadDemoWidgetState createState() => _HotReloadDemoWidgetState();
}

class _HotReloadDemoWidgetState extends State<HotReloadDemoWidget> {
  // State variables to demonstrate hot reload
  int _counter = 0;
  String _message = 'Welcome to Hot Reload Demo';
  List<String> _colorNames = ['Red', 'Blue', 'Green', 'Yellow'];
  int _currentColorIndex = 0;

  // Method to increment counter
  void _incrementCounter() {
    setState(() {
      _counter++;

      // Rotate through color names
      _currentColorIndex = (_currentColorIndex + 1) % _colorNames.length;

      // Update message based on counter
      _message = _counter % 2 == 0
          ? 'Even number clicked!'
          : 'Odd number clicked!';
    });
  }

  // Method to reset counter (demonstrating state preservation)
  void _resetCounter() {
    setState(() {
      _counter = 0;
      _message = 'Counter Reset!';
    });
  }

  @override
  Widget build(BuildContext context) {
    // Select color based on current index
    Color selectedColor = _getColorByIndex(_currentColorIndex);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hot Reload Demo'),
        backgroundColor: selectedColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _message,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: selectedColor,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Counter: $_counter',
              style: TextStyle(
                fontSize: 36,
                color: selectedColor,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Current Color: ${_colorNames[_currentColorIndex]}',
              style: TextStyle(
                fontSize: 18,
                color: selectedColor,
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _incrementCounter,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedColor,
                  ),
                  child: Text('Increment'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _resetCounter,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to get color based on index
  Color _getColorByIndex(int index) {
    switch (index) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.green;
      case 3:
        return Colors.yellow;
      default:
        return Colors.red;
    }
  }
}