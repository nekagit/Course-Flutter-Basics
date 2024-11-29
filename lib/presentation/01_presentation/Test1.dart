// Dart Programming Basics Assessment Solution

// Multiple Choice Questions (Multiple Choice Answers)
// 1. Correct answer: [x] `void main(){}`
// 2. Correct answer: [x] `String name = 'Hello'`
// 3. Correct answer: [x] `dynamic` can change types at runtime, `var` cannot
// 4. Correct answer: [x] `Map<String, int> ages = {'John': 25, 'Jane': 30}`
// 5. Correct answer: [x] `Person john = Person('John', 25)`

// Code Completion Solution
class Student {
  String name;  // 1. Correct property name
  int age;

  Student(this.name, this.age);  // 2. Complete constructor with name parameter

  void introduce() {
    print("My name is $name and I am $age years old.");  // 3. String interpolation
  }

  bool isAdult() {
    return age >= 18;  // 4. Return true if age is 18 or above
  }

  // 5. Add study method
  void study() {
    print("$name is studying Dart programming");
  }
}

// Code Analysis Solutions
// 1. The code allows `result` to change from an integer to a string because it's declared as `dynamic`, which can change types at runtime.
// 2. Output would be:
//    Alice is excellent!
//    Charlie is excellent!
// 3. Modified code for "good" students:
void analysisExample() {
  Map<String, int> scores = {
    'Alice': 95,
    'Bob': 85,
    'Charlie': 90,
    'David': 82
  };

  for (var entry in scores.entries) {
    if (entry.value >= 90) {
      print('${entry.key} is excellent!');
    } else if (entry.value >= 80 && entry.value < 90) {
      print('${entry.key} is good!');
    }
  }
}
// 4. `entry` has the type `MapEntry<String, int>`
// 5. If `final numbers` is used, you cannot reassign the list variable, but you CAN still modify its contents (add/remove/change elements)

// Bonus Question: Calculator Class
class Calculator {
  // Addition method
  double add(double a, double b) {
    return a + b;
  }

  // Subtraction method
  double subtract(double a, double b) {
    return a - b;
  }

  // Multiplication method
  double multiply(double a, double b) {
    return a * b;
  }

  // Division method with error handling
  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError('Cannot divide by zero');
    }
    return a / b;
  }
}

// Demonstration of Calculator usage
void main() {
  var calculator = Calculator();

  try {
    print('Addition: 10 + 5 = ${calculator.add(10, 5)}');
    print('Subtraction: 10 - 5 = ${calculator.subtract(10, 5)}');
    print('Multiplication: 10 * 5 = ${calculator.multiply(10, 5)}');
    print('Division: 10 / 5 = ${calculator.divide(10, 5)}');

    // Demonstrate division by zero error handling
    try {
      calculator.divide(10, 0);
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  } catch (e) {
    print('An unexpected error occurred: $e');
  }

  // Demonstrate Student class
  var student = Student('Alice', 20);
  student.introduce();
  student.study();
}