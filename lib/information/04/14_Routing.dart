import 'package:flutter/material.dart';

void main() => runApp(const NavigatorExampleApp());

class NavigatorExampleApp extends StatelessWidget {
  const NavigatorExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to the next screen without removing the current one
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenOne(),
                  ),
                );
              },
              child: const Text("Go to Screen One"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Replace the current screen with the new one
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenTwo(),
                  ),
                );
              },
              child: const Text("Replace with Screen Two"),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen One"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Pop the current screen and return to the previous one
            Navigator.pop(context);
          },
          child: const Text("Back to Home"),
        ),
      ),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Two"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Replace the current screen with Home Screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
          child: const Text("Replace with Home"),
        ),
      ),
    );
  }
}
