import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

// Root Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FutureBuilder Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DataScreen(),
    );
  }
}

// Simulate an API call or data fetch with a delay
Future<String> fetchData() async {
  await Future.delayed(const Duration(seconds: 3)); // Simulate delay
  return 'Hello, FutureBuilder!'; // Simulated data
}

// Screen to Display Data using FutureBuilder
class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder Example'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: fetchData(), // Fetch data asynchronously
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            // Check connection state
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While waiting for data
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // If error occurs
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              // If no data is available
              return const Text('No data available');
            } else {
              // When data is successfully fetched
              return Text(
                snapshot.data!, // Show the fetched data
                style: const TextStyle(fontSize: 24),
              );
            }
          },
        ),
      ),
    );
  }
}
