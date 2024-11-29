import 'dart:convert'; // For JSON encoding and decoding
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // For making HTTP requests

void main() {
  runApp(MyApp());
}

// Sample JSON structure:
// [
//   { "id": 1, "name": "John Doe", "email": "john@example.com" },
//   { "id": 2, "name": "Jane Smith", "email": "jane@example.com" }
// ]

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSON Serialization and Deserialization',
      home: UserPage(),
    );
  }
}

// User Model with JSON serialization/deserialization methods
class User {
  final int id;
  final String name;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  // Factory method to create a User object from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  // Method to convert a User object back into JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}

// Widget for displaying user data
class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<User> users = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  // Fetch users from a sample API
  Future<void> fetchUsers() async {
    const String apiUrl = 'https://jsonplaceholder.typicode.com/users';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Parse the JSON response into a list of User objects
        List<dynamic> jsonData = json.decode(response.body);
        setState(() {
          users = jsonData.map((userJson) => User.fromJson(userJson)).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching users: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),
            trailing: Icon(Icons.arrow_forward),
          );
        },
      ),
    );
  }
}

// JSON serialization example: Convert a User object to JSON
void jsonSerializationExample() {
  final user = User(id: 1, name: "John Doe", email: "john@example.com");
  final String jsonString = json.encode(user.toJson());
  print("Serialized JSON: $jsonString");
}

// JSON deserialization example: Convert JSON string to a User object
void jsonDeserializationExample() {
  const String jsonString = '{"id":1,"name":"John Doe","email":"john@example.com"}';
  final Map<String, dynamic> jsonMap = json.decode(jsonString);
  final user = User.fromJson(jsonMap);
  print("Deserialized User: ${user.name}, ${user.email}");
}
