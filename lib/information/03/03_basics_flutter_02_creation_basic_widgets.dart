import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Widgets Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BasicWidgetsDemo(),
    );
  }
}

class BasicWidgetsDemo extends StatefulWidget {
  const BasicWidgetsDemo({super.key});

  @override
  State<BasicWidgetsDemo> createState() => _BasicWidgetsDemoState();
}

class _BasicWidgetsDemoState extends State<BasicWidgetsDemo> {
  bool _switchValue = false;
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Widgets'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text Widget
            const Text(
              'Hello Flutter!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 20),

            // Button Examples
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Elevated Button Pressed!')),
                );
              },
              child: const Text('Elevated Button'),
            ),

            const SizedBox(height: 10),

            TextButton(
              onPressed: () {},
              child: const Text('Text Button'),
            ),

            const SizedBox(height: 10),

            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined Button'),
            ),

            const SizedBox(height: 20),

            // Image Widget
            Container(
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: const Center(
                child: FlutterLogo(size: 100),
              ),
            ),

            const SizedBox(height: 20),

            // TextField
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter text',
                border: OutlineInputBorder(),
                hintText: 'Type something...',
              ),
            ),

            const SizedBox(height: 20),

            // Row with Icon and Text
            Row(
              children: const [
                Icon(Icons.star, color: Colors.yellow),
                SizedBox(width: 8),
                Text('Row with Icon and Text'),
              ],
            ),

            const SizedBox(height: 20),

            // Switch
            Row(
              children: [
                const Text('Switch Example:'),
                Switch(
                  value: _switchValue,
                  onChanged: (bool value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
              ],
            ),

            // Slider
            Slider(
              value: _sliderValue,
              min: 0,
              max: 100,
              divisions: 10,
              label: _sliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),

            // Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: const [
                    Text('Card Widget'),
                    SizedBox(height: 8),
                    Text('This is a card with some content'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}