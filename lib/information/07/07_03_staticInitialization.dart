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
      title: 'Static Initializer Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

// HomeScreen widget
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Variable that uses static initializer
  final String statusMessage = StaticInitializer.status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Static Initializer Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Status Message: $statusMessage',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Accessing a static method
                StaticInitializer.updateStatus('Status Updated!');
                setState(() {
                  // Trigger a UI update
                });
              },
              child: const Text('Update Status'),
            ),
            const SizedBox(height: 20),
            Text(
              'Current Status: ${StaticInitializer.status}',
              style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

// A class demonstrating static initializers
class StaticInitializer {
  // Static variable
  static String status = 'Initial Status';

  // Static block for initialization
  static void initialize() {
    status = 'Initialized by Static Initializer';
    print('Static Initializer called');
  }

  // Static method to update the status
  static void updateStatus(String newStatus) {
    status = newStatus;
    print('Status Updated: $newStatus');
  }

  // Static constructor (initializes at first access)
  static late final String initializationMessage = _initialize();

  // Private method to handle the initialization
  static String _initialize() {
    print('Static Constructor initialized');
    return 'Static initialization complete!';
  }
}
