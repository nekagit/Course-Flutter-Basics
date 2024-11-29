import 'dart:convert'; // For JSON parsing
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the http package

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'REST API Integration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<User>> _users;

  @override
  void initState() {
    super.initState();
    _users = fetchUsers(); // Call the fetchUsers function when the widget is created
  }

  // Fetch data from a REST API
  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      // If the server returns an error, throw an exception
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REST API Integration'),
      ),
      body: FutureBuilder<List<User>>(
        future: _users,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Show loading spinner while waiting
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // Show error message
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found!')); // Show message if no data
          }

          // If data is loaded, display it in a ListView
          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(users[index].name),
                subtitle: Text(users[index].email),
              );
            },
          );
        },
      ),
    );
  }
}
// user.dart
class User {
  final String name;
  final String username;
  final String email;

  User({required this.name, required this.username, required this.email});

  // Factory method to create a User object from JSON data
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      username: json['username'],
      email: json['email'],
    );
  }
}
