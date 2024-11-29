// Einstiegspunkt in einer Dart-Anwendung

void main() {
  Person alice = Person('Alice', 20);
  alice.introduce();
}

// Ueberblick ueber Klassen und Objekte

class Person {
  String name = '';
  int age = 0;
  Person(this.name, this.age);
  void introduce() {
    print('My name is $name and I am $age years old');
  }
}


// Ueberblick ueber Dart Functions
int multiply(int a, int b) => a * b;

// Ueberblick ueber Datentypen: Bool, Listen und Maps
void advancedTypes() {
  List<int> number = [10, 20, 0, 0, 0];
  List<String> names = ['Alice','Bob','Charlie'];

  number.add(1);
  number.addAll([2, 3]);
  number.remove(0);

  bool isStudent = true;
  bool isWorking = false;
  bool isAdult = number[0] >= 18;

  var x = 32;
  dynamic y = 33;
  y = 'String ${multiply(x, y)}';
  print(y);

  Map<String, int> people = {
    names[0]: number[0],
    'Bob': 25,
    "Charlie": 35
  };

}











// Ueberblick ueber Datentypen: Zahlen und Strings
void primitiveTypes() {
  int age = 30;
  double pi = 3.14;
  String name = 'Alice';
  String greeting = 'Hallo, $name!';

  print(age);
  print(pi);
  print(name);
  print(greeting);

  int bigNumber = 1000000;
  double bigNumberHex = 1e6;
  int hexValue = 0xDEADBEEF;

  String mulitLine = '''
  This is a mulit-
  line string in Dart
  ''';

  String calculation = 'Sum: ${2 + 2}';
  String complexAging = 'Age in 5 years: ${age + 5}';

  print(bigNumber);
  print(bigNumberHex);
  print(hexValue);
  print(mulitLine);
  print(calculation);
  print(complexAging);
}