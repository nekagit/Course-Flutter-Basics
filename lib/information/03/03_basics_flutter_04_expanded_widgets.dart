import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flexible & Expanded Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FlexibleExpandedDemo(),
    );
  }
}

class FlexibleExpandedDemo extends StatelessWidget {
  const FlexibleExpandedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible & Expanded Widgets'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Example 1: Basic Flexible usage
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Example 1: Flexible with different flex values',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.red,
                      child: const Center(child: Text('flex: 1')),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      color: Colors.green,
                      child: const Center(child: Text('flex: 2')),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                      color: Colors.blue,
                      child: const Center(child: Text('flex: 3')),
                    ),
                  ),
                ],
              ),
            ),

            // Example 2: Expanded usage
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Example 2: Expanded widgets',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.purple,
                      child: const Center(child: Text('Expanded 1')),
                    ),
                  ),
                  Container(
                    width: 50,
                    color: Colors.yellow,
                    child: const Center(child: Text('Fixed')),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.orange,
                      child: const Center(child: Text('Expanded 2')),
                    ),
                  ),
                ],
              ),
            ),

            // Example 3: Flexible with fit property
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Example 3: Flexible with fit property',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      color: Colors.teal,
                      child: const Center(child: Text('tight')),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      color: Colors.pink,
                      child: const Center(child: Text('loose')),
                    ),
                  ),
                ],
              ),
            ),

            // Example 4: Nested Flexible and Expanded
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Example 4: Nested Flexible and Expanded',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            color: Colors.cyan,
                            child: const Center(child: Text('Flex 2')),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.indigo,
                            child: const Center(child: Text('Flex 1')),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.amber,
                      child: const Center(child: Text('Expanded')),
                    ),
                  ),
                ],
              ),
            ),

            // Example 5: Flexible with overflow
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Example 5: Flexible with overflow handling',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      color: Colors.deepOrange,
                      child: const Center(
                        child: Text(
                          'This is a very long text that might overflow',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    color: Colors.lightGreen,
                    child: const Center(child: Text('Fixed width')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}