import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(StatelessVsStatefulApp());
}

// Stateless Widget Example: Static Profile Card
class ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String avatarUrl;

  // Constructor with required parameters
  const ProfileCard({
    Key? key,
    required this.name,
    required this.email,
    required this.avatarUrl
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(avatarUrl),
        ),
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(email),
      ),
    );
  }
}

// Stateful Widget Example: Interactive Color Changer
class ColorChangerWidget extends StatefulWidget {
  @override
  _ColorChangerWidgetState createState() => _ColorChangerWidgetState();
}

class _ColorChangerWidgetState extends State<ColorChangerWidget> {
  Color _backgroundColor = Colors.white;

  void _changeColor() {
    setState(() {
      // Generate a random color
      _backgroundColor = Color.fromRGBO(
          Random().nextInt(256),
          Random().nextInt(256),
          Random().nextInt(256),
          1
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      color: _backgroundColor,
      child: Center(
        child: ElevatedButton(
          onPressed: _changeColor,
          child: Text('Change Background Color'),
        ),
      ),
    );
  }
}

// Main App Widget Demonstrating Both
class StatelessVsStatefulApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateless vs Stateful Widgets'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Stateless Widget Example
            Text(
              'Stateless Widget (Profile Card)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ProfileCard(
              name: 'John Doe',
              email: 'john.doe@example.com',
              avatarUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
            ),

            SizedBox(height: 20),

            // Stateful Widget Example
            Text(
              'Stateful Widget (Color Changer)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ColorChangerWidget(),
          ],
        ),
      ),
    );
  }
}