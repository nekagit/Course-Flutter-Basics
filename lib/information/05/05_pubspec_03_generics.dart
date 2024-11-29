import 'dart:math';

void main() {
  // Example 1: Generic List Operations
  final GenericList<int> intList = GenericList<int>();
  intList.addItem(42);
  intList.addItem(100);
  print("Integer List: ${intList.items}");

  final GenericList<String> stringList = GenericList<String>();
  stringList.addItem("Flutter");
  stringList.addItem("Dart");
  print("String List: ${stringList.items}");

  // Example 2: Generic Pair Class
  final Pair<int, String> idAndName = Pair(1, "John Doe");
  print("Pair: (${idAndName.first}, ${idAndName.second})");

  final Pair<double, bool> priceAndAvailable = Pair(19.99, true);
  print("Pair: (${priceAndAvailable.first}, ${priceAndAvailable.second})");

  // Example 3: Generic Function
  print("Reversed List: ${reverseList<int>([1, 2, 3, 4, 5])}");
  print("Reversed Strings: ${reverseList<String>(['Dart', 'Flutter', 'Generics'])}");

  // Example 4: Generic Repository for Data Handling
  final Repository<String> stringRepo = Repository<String>();
  stringRepo.addData("Data1");
  stringRepo.addData("Data2");
  print("Repository Data: ${stringRepo.getAllData()}");

  final Repository<int> numberRepo = Repository<int>();
  numberRepo.addData(99);
  numberRepo.addData(100);
  print("Repository Data: ${numberRepo.getAllData()}");

  // Example 5: Generic Widget Example
  print("Random Item: ${getRandomItem<String>(['Apple', 'Banana', 'Cherry'])}");
  print("Random Number: ${getRandomItem<int>([10, 20, 30, 40, 50])}");
}

// Example 1: Generic Class for List Management
class GenericList<T> {
  final List<T> _items = [];

  void addItem(T item) {
    _items.add(item);
  }

  List<T> get items => _items;
}

// Example 2: Generic Class for Pairing Two Values
class Pair<T1, T2> {
  final T1 first;
  final T2 second;

  Pair(this.first, this.second);
}

// Example 3: Generic Function to Reverse a List
List<T> reverseList<T>(List<T> input) {
  return input.reversed.toList();
}

// Example 4: Generic Repository Class for CRUD Operations
class Repository<T> {
  final List<T> _data = [];

  void addData(T item) {
    _data.add(item);
  }

  void removeData(T item) {
    _data.remove(item);
  }

  List<T> getAllData() {
    return List.unmodifiable(_data);
  }
}

// Example 5: Generic Utility Function
T getRandomItem<T>(List<T> items) {
  final random = Random();
  return items[random.nextInt(items.length)];
}
