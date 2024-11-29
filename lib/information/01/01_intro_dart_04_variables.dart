void main() {
  // Basic Example: var vs dynamic
  var name = "John"; // Type inferred as String
  // name = 42; // Error: A value of type 'int' can't be assigned to a variable of type 'String'.

  dynamic anything = "John";
  print(anything.runtimeType); // Output: String

  anything = 42; // No error
  print(anything.runtimeType); // Output: int

  // Assigning a New Type
  var number = 10; // Type inferred as int
  // number = "ten"; // Error: Can't assign a String to an int variable.

  dynamic value = 10; // Type is determined at runtime
  value = "ten"; // Allowed
  print(value); // Output: ten

  // Function Behavior
  var multiplyByTwo = (int x) => x * 2; // Type is inferred
  print(multiplyByTwo(5)); // Output: 10
  // multiplyByTwo = (String s) => s.length; // Error: Type mismatch.

  dynamic flexibleFunction = (int x) => x * 2;
  print(flexibleFunction(5)); // Output: 10

  flexibleFunction = (String s) => s.length; // Allowed
  print(flexibleFunction("Flutter")); // Output: 7

  // Method Parameter Comparison
  void printVar(var input) {
    print("Var: $input");
    // Cannot reassign input to another type inside the method.
  }

  void printDynamic(dynamic input) {
    print("Dynamic: $input");
    input = "Now it's a String"; // Allowed
    print(input);
  }

  printVar(123);
  // printVar("Hello"); // Error: If `input` was inferred as int initially.

  printDynamic(123); // Works
  printDynamic("Hello"); // Works

  // Collections with var and dynamic
  var numbers = [1, 2, 3]; // Inferred as List<int>
  numbers.add(4);
  // numbers.add("five"); // Error: Can't add a String to a List<int>.

  dynamic mixedList = [1, 2, 3]; // Type is determined at runtime
  mixedList.add("four");
  print(mixedList); // Output: [1, 2, 3, "four"]

  // Practical Use Cases
  var age = 30;
  // age = "thirty"; // Error: Type mismatch.

  dynamic flexibleValue = 30;
  flexibleValue = "thirty"; // No error
  print("Value is now: $flexibleValue");

  dynamic jsonData = {"name": "Flutter", "version": 3.0};
  print(jsonData['name']); // Output: Flutter

  jsonData = "A simple string";
  print(jsonData); // Output: A simple string

  // Type Safety
  var safe = 42; // Compiler ensures `safe` is always an int.
  // safe = "Not allowed"; // Compile-time error

  dynamic unsafe = 42;
  unsafe = "Allowed"; // Runtime flexibility
  print(unsafe.runtimeType); // Output: String
}
