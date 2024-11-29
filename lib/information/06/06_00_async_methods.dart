import 'dart:async'; // For async operations
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Async Operations in Dart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _data = "Waiting for data...";
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // Simulate an asynchronous network request
  Future<void> fetchData() async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    try {
      // Simulate a network request with a delay
      await Future.delayed(Duration(seconds: 3)); // Simulate delay
      setState(() {
        _data = "Data loaded successfully!";
        _isLoading = false; // Hide loading indicator
      });
    } catch (e) {
      setState(() {
        _data = "Error loading data: $e";
        _isLoading = false; // Hide loading indicator
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Async Operations in Dart'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _data,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            if (_isLoading) CircularProgressIndicator(), // Show loading spinner if data is being fetched
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchData,
        tooltip: 'Fetch Data',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
