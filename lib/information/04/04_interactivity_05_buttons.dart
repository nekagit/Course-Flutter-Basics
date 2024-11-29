import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ButtonExamplesScreen(),
    );
  }
}

class ButtonExamplesScreen extends StatelessWidget {
  const ButtonExamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Examples'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton Example
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Elevated Button pressed!')),
                );
              },
              child: const Text('Elevated Button'),
            ),
            const SizedBox(height: 20),

            // TextButton Example
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Text Button pressed!')),
                );
              },
              child: const Text('Text Button'),
            ),
            const SizedBox(height: 20),

            // OutlinedButton Example
            OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Outlined Button pressed!')),
                );
              },
              child: const Text('Outlined Button'),
            ),
            const SizedBox(height: 20),

            // IconButton Example
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Icon Button pressed!')),
                );
              },
            ),
            const SizedBox(height: 20),

            // ElevatedButton with Icon
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Button with Icon pressed!')),
                );
              },
              icon: const Icon(Icons.send),
              label: const Text('Send'),
            ),
            const SizedBox(height: 20),

            // Customized ElevatedButton
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Custom Button pressed!')),
                );
              },
              child: const Text('Custom Styled Button'),
            ),
          ],
        ),
      ),
    );
  }
}