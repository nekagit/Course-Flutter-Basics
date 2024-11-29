// Dart Programming Language Basics
// A comprehensive guide covering fundamental concepts

// 1. ENTRY POINT
// Every Dart application must have a main() function that serves as the entry point
void main() {
  print('Hello, World!'); // Basic print statement

  // Running examples from different sections
  dataTypesExample();
  variableDeclarationExample();
  functionExample();
  classExample();
}

// 2. DATA TYPES - NUMBERS AND STRINGS
void dataTypesExample() {
  // Integer examples
  int age = 30;
  int hexValue = 0xDEADBEEF; // Hexadecimal number
  int bigNumber = 1000000;   // Can be written as 1e6

  // Double examples
  double pi = 3.14159;
  double scientificNotation = 1.42e5;

  // String examples
  String name = 'Alice';
  String multiline = '''
    This is a multiline
    string in Dart
  ''';

  // String interpolation
  String greeting = 'Hello, $name!';                     // Simple interpolation
  String calculation = 'Sum: ${2 + 2}';                 // Expression interpolation
  String complexGreeting = 'Age in 5 years: ${age + 5}'; // Variable computation

  print('\nData Types Examples:');
  print(greeting);
  print(calculation);
  print(complexGreeting);
}

// 3. DATA TYPES - BOOL, LISTS, AND MAPS
void collectionTypesExample() {
  // Boolean examples
  int age = 30;
  bool isStudent = true;
  bool isWorking = false;
  bool isAdult = age >= 18; // Boolean expression

  // List examples
  List<int> numbers = [1, 2, 3, 4, 5];
  List<String> names = ['Alice', 'Bob', 'Charlie'];

  // List operations
  numbers.add(6);                // Add element
  names.addAll(['David', 'Eve']); // Add multiple elements
  numbers.remove(1);             // Remove element

  // Fixed-length list
  List<int> fixedList = List.filled(5, 0); // Creates [0, 0, 0, 0, 0]

  // Map examples
  Map<String, int> ages = {
    'Alice': 30,
    'Bob': 25,
    'Charlie': 35,
  };

  // Map operations
  ages['David'] = 28;    // Add new key-value pair
  ages.remove('Alice');  // Remove entry

  print('\nCollection Types Examples:');
  print('Numbers: $numbers');
  print('Names: $names');
  print('Ages: $ages');
}

// 4. VARIABLE DECLARATION - VAR VS DYNAMIC
void variableDeclarationExample() {
  // Using var - type is inferred at compile time and cannot change
  var name = 'Alice';    // Type is inferred as String
  var age = 30;         // Type is inferred as int
  // name = 42;         // Error: can't assign int to String

  // Using dynamic - type can change at runtime
  dynamic dynamicVar = 'Hello';
  print('\nDynamic Variable Examples:');
  print(dynamicVar);     // String
  dynamicVar = 42;      // Can change to int
  print(dynamicVar);     // int
  dynamicVar = true;    // Can change to bool
  print(dynamicVar);     // bool

  // Late initialization
  late String lastName;
  // Use lastName later...
  lastName = 'Smith';
  print(lastName);
}

// 5. FUNCTIONS
// Regular function with return type
int add(int a, int b) {
  return a + b;
}

// Arrow syntax for simple functions
int multiply(int a, int b) => a * b;

// Optional parameters using []
String greet([String? name]) {
  return 'Hello, ${name ?? 'Guest'}!';
}

// Named parameters using {}
void printPersonDetails({
  required String name,
  int? age,
  String? country
}) {
  print('Name: $name');
  if (age != null) print('Age: $age');
  if (country != null) print('Country: $country');
}

void functionExample() {
  print('\nFunction Examples:');
  print('Add: ${add(5, 3)}');
  print('Multiply: ${multiply(4, 2)}');
  print(greet());
  print(greet('Alice'));

  printPersonDetails(
      name: 'Alice',
      age: 30,
      country: 'USA'
  );
}

// 6. CLASSES AND OBJECTS
// Basic class definition
class Person {
  // Properties
  String name = '';
  int age = 0;

  // Constructor
  Person(this.name, this.age);

  // Named constructor
  Person.guest() {
    name = 'Guest';
    age = 0;
  }

  // Method
  void introduce() {
    print('My name is $name and I am $age years old.');
  }
}

// Class with private members (starting with _)
class _PrivateClass {
  String _privateField = 'Private';

  void _privateMethod() {
    print('This is private');
  }
}

// Class inheritance
class Student extends Person {
  String school;

  Student(String name, int age, this.school) : super(name, age);

  @override
  void introduce() {
    super.introduce();
    print('I study at $school.');
  }
}

void classExample() {
  print('\nClass Examples:');
  var alice = Person('Alice', 30);
  alice.introduce();

  var guest = Person.guest();
  guest.introduce();

  var student = Student('Bob', 20, 'Dart University');
  student.introduce();
}