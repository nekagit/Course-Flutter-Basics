import 'package:flutter/material.dart';
import 'package:flutter_tutoring/presentation/03_presentation/Custom_Card.dart';

import 'Custom_Dynamic_List.dart';

void main() {
  runApp(const BasicWidgets());
}

class BasicWidgets extends StatelessWidget {
  const BasicWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Widgets Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DynamicList(),
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
            const Text(
              'Hallo Flutter!',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 21),
            CustomCard(
                title: "Flutter",
                description: "Greetings Summoner",
                icon: Icons.home,
                customChild: const DynamicList()),
          ],
        ),
      ),
    );
  }
}
