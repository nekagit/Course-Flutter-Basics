import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive UI Design for Web',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResponsiveHomePage(),
    );
  }
}

class ResponsiveHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width
    double width = MediaQuery.of(context).size.width;

    // Adjust layout based on screen width
    if (width > 1200) {
      // Large screen (Desktop)
      return DesktopLayout();
    } else if (width > 800) {
      // Medium screen (Tablet)
      return TabletLayout();
    } else {
      // Small screen (Mobile)
      return MobileLayout();
    }
  }
}

class DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desktop Layout'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blueAccent,
              child: Center(child: Text('Sidebar', style: TextStyle(color: Colors.white))),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.grey[200],
              child: Center(child: Text('Main Content Area', style: TextStyle(fontSize: 24))),
            ),
          ),
        ],
      ),
    );
  }
}

class TabletLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tablet Layout'),
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            color: Colors.blueAccent,
            child: Center(child: Text('Header', style: TextStyle(color: Colors.white))),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: Center(child: Text('Main Content Area', style: TextStyle(fontSize: 24))),
            ),
          ),
        ],
      ),
    );
  }
}

class MobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile Layout'),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.blueAccent,
            child: Center(child: Text('Header', style: TextStyle(color: Colors.white))),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: Center(child: Text('Main Content Area', style: TextStyle(fontSize: 18))),
            ),
          ),
        ],
      ),
    );
  }
}
