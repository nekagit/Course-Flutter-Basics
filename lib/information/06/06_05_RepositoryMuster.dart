import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// User Model
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

// Repository Interface
abstract class UserRepository {
  Future<List<User>> getUsers();
}

// Repository Implementation
class UserRepositoryImpl implements UserRepository {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  @override
  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}

// Service Layer
class UserService {
  final UserRepository repository;

  UserService({required this.repository});

  Future<List<User>> fetchUsers() async {
    return await repository.getUsers();
  }
}

// Main UI
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Repository Pattern Example',
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
    final userRepository = UserRepositoryImpl();
    final userService = UserService(repository: userRepository);
    _users = userService.fetchUsers(); // Fetch users using the service
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Repository Pattern Example'),
      ),
      body: FutureBuilder<List<User>>(
        future: _users,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Show loading spinner
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // Show error message
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found!')); // Show empty state
          }

          // Display list of users
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
