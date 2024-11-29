import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Define the initial route
      initialRoute: '/',

      // Define named routes
      routes: {
        '/': (context) => HomeScreen(),
        '/second': (context) => SecondScreen(),
        '/third': (context) => ThirdScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the Home Screen'),
            ElevatedButton(
              onPressed: () {
                // Navigate to the second screen
                Navigator.pushNamed(context, '/second');
              },
              child: Text('Go to Second Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the Second Screen'),
            ElevatedButton(
              onPressed: () {
                // Navigate to the third screen
                Navigator.pushNamed(context, '/third');
              },
              child: Text('Go to Third Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                // Go back to the previous screen
                Navigator.pop(context);
              },
              child: Text('Back to Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the Third Screen'),
            ElevatedButton(
              onPressed: () {
                // Go back to the previous screen
                Navigator.pop(context);
              },
              child: Text('Back to Second Screen'),
            ),
          ],
        ),
      ),
    );
  }
}