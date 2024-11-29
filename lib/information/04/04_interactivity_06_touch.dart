import 'package:flutter/material.dart';

void main() {
  runApp(const GestureDetectionApp());
}

class GestureDetectionApp extends StatelessWidget {
  const GestureDetectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const GestureDetectionScreen(),
    );
  }
}

class GestureDetectionScreen extends StatefulWidget {
  const GestureDetectionScreen({super.key});

  @override
  _GestureDetectionScreenState createState() => _GestureDetectionScreenState();
}

class _GestureDetectionScreenState extends State<GestureDetectionScreen> {
  String _gestureInfo = "Perform a Gesture!";

  void _updateGestureInfo(String gesture) {
    setState(() {
      _gestureInfo = gesture;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tap and Gesture Detection'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => _updateGestureInfo("Tap detected"),
        onDoubleTap: () => _updateGestureInfo("Double Tap detected"),
        onLongPress: () => _updateGestureInfo("Long Press detected"),
        onPanUpdate: (details) => _updateGestureInfo("Pan detected: ${details.delta}"),
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(15),
            ),
            alignment: Alignment.center,
            child: Text(
              _gestureInfo,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
