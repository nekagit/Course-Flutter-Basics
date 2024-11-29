import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Parent Class: Animal
class Animal {
  final String name;

  Animal(this.name);

  void speak() {
    print("$name makes a sound.");
  }
}

// Child Class: Dog
class Dog extends Animal {
  Dog(super.name);

  @override
  void speak() {
    // Call the parent class method
    super.speak();
    // Add specific functionality for the child class
    print("$name barks!");
  }
}

// Flutter App Example
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parent Class Method Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AnimalScreen(),
    );
  }
}

// Main Screen
class AnimalScreen extends StatelessWidget {
  const AnimalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dog = Dog("Buddy");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Parent Class Method Example"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Call the speak method, which uses both parent and child implementations
            dog.speak();
          },
          child: const Text("Make Animal Speak"),
        ),
      ),
    );
  }
}
