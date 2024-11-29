import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DataTypeDemo(),
    );
  }
}

class DataTypeDemo extends StatefulWidget {
  @override
  _DataTypeDemoState createState() => _DataTypeDemoState();
}

class _DataTypeDemoState extends State<DataTypeDemo> {
  // Bool data type
  bool isDarkMode = false;

  // List data type
  List<String> fruits = ["Apple", "Banana", "Cherry", "Date"];

  // Map data type
  Map<String, dynamic> userInfo = {
    "name": "John Doe",
    "age": 30,
    "isPremiumUser": true,
  };

  // Function to toggle dark mode
  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Data Types"),
        backgroundColor: isDarkMode ? Colors.black : Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bool Example
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark Mode:",
                  style: TextStyle(fontSize: 18),
                ),
                Switch(
                  value: isDarkMode,
                  onChanged: (value) => toggleDarkMode(),
                ),
              ],
            ),
            Divider(),

            // List Example
            Text(
              "Favorite Fruits:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...fruits.map((fruit) => ListTile(
              leading: Icon(Icons.check_circle),
              title: Text(fruit),
            )),

            Divider(),

            // Map Example
            Text(
              "User Info:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text("Name: ${userInfo['name']}"),
            ),
            ListTile(
              title: Text("Age: ${userInfo['age']}"),
            ),
            ListTile(
              title: Text(
                  "Premium User: ${userInfo['isPremiumUser'] ? "Yes" : "No"}"),
            ),
          ],
        ),
      ),
    );
  }
}
