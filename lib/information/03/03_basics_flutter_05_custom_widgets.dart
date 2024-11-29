import 'package:flutter/material.dart';

void main() {
  runApp(CustomWidgetApp());
}

// 1. Basic Custom Stateless Widget
class CustomWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomWidgetDemoScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class CustomWidgetDemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Widgets Demo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 2. Simple Custom Widget with Parameters
            CustomButton(
              text: 'Custom Button 1',
              onPressed: () {
                print('Custom Button 1 Pressed');
              },
            ),

            // 3. Custom Widget with Complex Styling
            CustomCard(
              title: 'Flutter Development',
              description: 'Learn to create amazing mobile applications',
              icon: Icons.code,
            ),

            // 4. Stateful Custom Widget
            CustomCounterWidget(),

            // 5. Composite Custom Widget
            CustomProfileWidget(
              name: 'John Doe',
              email: 'john.doe@example.com',
              avatarUrl: 'https://example.com/avatar.png',
            ),
          ],
        ),
      ),
    );
  }
}

// 2. Custom Button Widget (Stateless)
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor, backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

// 3. Custom Card Widget (Stateless)
class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const CustomCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 50, color: Colors.blue),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(color: Colors.grey),
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

// 4. Stateful Custom Counter Widget
class CustomCounterWidget extends StatefulWidget {
  @override
  _CustomCounterWidgetState createState() => _CustomCounterWidgetState();
}

class _CustomCounterWidgetState extends State<CustomCounterWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Counter: $_counter',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 5. Composite Custom Profile Widget (Stateless)
class CustomProfileWidget extends StatelessWidget {
  final String name;
  final String email;
  final String avatarUrl;

  const CustomProfileWidget({
    Key? key,
    required this.name,
    required this.email,
    required this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(avatarUrl),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  email,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}