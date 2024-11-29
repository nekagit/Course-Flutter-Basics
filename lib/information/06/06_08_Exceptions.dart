import 'package:flutter/material.dart';

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
      title: 'Exception Handling in Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

// Home Screen Widget
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exception Handling Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              // Simulate API call and exception
              final data = await fetchData();
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Success'),
                  content: Text(data),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            } catch (e) {
              // Catch the exception and display error
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Error'),
                  content: Text('Something went wrong: $e'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            }
          },
          child: const Text('Fetch Data'),
        ),
      ),
    );
  }

  // Simulate a network call that throws an exception
  Future<String> fetchData() async {
    await Future.delayed(const Duration(seconds: 2));

    // Throw an exception to simulate an error
    throw Exception("Failed to fetch data from API");
  }
}
