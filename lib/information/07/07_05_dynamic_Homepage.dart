import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dynamic Homepage Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const DynamicHomePage(),
    );
  }
}

class DynamicHomePage extends StatefulWidget {
  const DynamicHomePage({super.key});

  @override
  _DynamicHomePageState createState() => _DynamicHomePageState();
}

class _DynamicHomePageState extends State<DynamicHomePage> {
  // Simulated data
  List<String> dynamicContent = [
    'Welcome to my homepage!',
    'Tap the button below to load new content.',
  ];

  // Function to simulate fetching new data (e.g., from an API)
  Future<void> fetchNewContent() async {
    setState(() {
      dynamicContent.addAll([
        'New Content Loaded!',
        'This could be fetched from an API.',
        'Dynamic content changes based on the state.',
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Homepage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Display dynamic content
            for (var content in dynamicContent)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  content,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            const SizedBox(height: 20),

            // Button to simulate fetching new content
            ElevatedButton(
              onPressed: fetchNewContent,
              child: const Text('Load More Content'),
            ),
          ],
        ),
      ),
    );
  }
}
