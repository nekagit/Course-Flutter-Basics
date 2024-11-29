// Einstiegspunkt in eine Dart-Anwendung ( main )
// Ueberblick ueber Datentypen: Zahlen und Strings
// Ueberblick ueber Datentypen: Bool, Listen und Maps
// Unterschied zwischen var und dynamic
// Funktionen in Dart
// Einfuehrung in Klassen und Objekte
// https://dart.dev/language/variables
// https://dart.dev/language/operators
// https://dart.dev/language/comments
// https://dart.dev/language/keywords

int age = 30;
double pi = 3.14;
String name = 'Alice';
String greeting = 'Hello, $name!';

bool isStudent = true;
bool isRetired = false;

List<int> numbers = [1,2,3,4,5];
List<String> names = ['Alice', 'Bob', 'Charlie'];

Map<String, int> ages = {
  'Alice': 30,
  'Bob': 25,
  'Charlie': 35,
};

var x = 32;
var firstName = 'Alice';

dynamic dynamicType(){
  dynamic value = 42; // Declared as a dynamic type
  value = 'Alice';    // Re-assigned, valid because `value` is dynamic
  return value;
}

int add(int a, int b) {
  return a+b;
}

void greet(String name) {
  print('Hello, $firstName!');
}

class Person {
  String name;
  int age;
  Person(this.name, this.age);

  void introduce() {
    print('My name is $name and I am $age years old!');
  }
}

void main() {
  print('hello world');
  Person alice = Person('Alice', 30);
  alice.introduce();
}