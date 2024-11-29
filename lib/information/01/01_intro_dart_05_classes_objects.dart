// Basic class definition
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Person {
  // Properties (instance variables)
  String name;
  int age;

  // Constructor
  Person(this.name, this.age);

  // Named constructor
 // Person.guest() {
   // name = "Guest";
    //age = 18;
  //}

  // Method
  void introduce() {
    print("Hello, I'm $name and I'm $age years old.");
  }

  // Getter
  String get details => "$name ($age years old)";

  // Setter
  set updateAge(int newAge) {
    if (newAge >= 0) {
      age = newAge;
    }
  }
}

// Example of inheritance
class Student extends Person {
  String studentId;
  List<String> courses = [];

  // Constructor using super
  Student(String name, int age, this.studentId) : super(name, age);

  // Method to add a course
  void addCourse(String course) {
    courses.add(course);
  }

  // Override parent method
  @override
  void introduce() {
    super.introduce();
    print("I'm a student with ID: $studentId");
    print("My courses: ${courses.join(", ")}");
  }
}

// Example usage in a Flutter widget
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  void demonstrateClassesAndObjects() {
    // Creating objects
    var person1 = Person("Alice", 25);
    //var person2 = Person.guest();

    // Using methods
    person1.introduce();
    print(person1.details);

    // Using setters
    person1.updateAge = 26;

    // Working with inherited class
    var student = Student("Bob", 20, "STU001");
    student.addCourse("Flutter Development");
    student.addCourse("Dart Programming");
    student.introduce();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classes and Objects Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: demonstrateClassesAndObjects,
          child: Text('Run Demo'),
        ),
      ),
    );
  }
}