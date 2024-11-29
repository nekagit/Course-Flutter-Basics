// Main entry point of the Dart application
void main() {
  // Basic print statement
  print('Willkommen in der Dart-Anwendung!');

  // Demonstrate different types of entry point scenarios
  runMainApplicationLogic();
  demonstrateClassUsage();
  showAsyncOperations();
  illustrateErrorHandling();
}

// Function to demonstrate core application logic
void runMainApplicationLogic() {
  print('\n--- Anwendungslogik ---');

  // Basic data structures
  List<String> items = ['Apfel', 'Banane', 'Kirsche'];
  Map<String, int> preise = {
    'Apfel': 2,
    'Banane': 1,
    'Kirsche': 3
  };

  // Iteration and processing
  items.forEach((item) {
    print('$item kostet ${preise[item]} Euro');
  });
}

// Demonstration of class usage
class Benutzer {
  String name;
  int alter;

  // Konstruktor
  Benutzer(this.name, this.alter);

  // Methode zur Vorstellung
  void stellen() {
    print('Hallo, ich bin $name und $alter Jahre alt.');
  }
}

void demonstrateClassUsage() {
  print('\n--- Klassenverwendung ---');

  Benutzer benutzer1 = Benutzer('Max Mustermann', 30);
  benutzer1.stellen();

  // Verwendung von Konstruktoren und Methoden
  var benutzer2 = Benutzer('Lisa Schmidt', 25);
  benutzer2.stellen();
}

// Asynchrone Operationen demonstrieren
void showAsyncOperations() async {
  print('\n--- Asynchrone Operationen ---');

  // Beispiel einer asynchronen Funktion
  Future<String> holeDaten() async {
    // Simuliere eine Netzwerkverzögerung
    await Future.delayed(Duration(seconds: 2));
    return 'Daten wurden erfolgreich geladen';
  }

  try {
    String result = await holeDaten();
    print(result);
  } catch (e) {
    print('Fehler beim Laden der Daten: $e');
  }
}

// Fehlerbehandlung demonstrieren
void illustrateErrorHandling() {
  print('\n--- Fehlerbehandlung ---');

  try {
    int ergebnis = berechneDividition(10, 0);
    print('Ergebnis: $ergebnis');
  } on UnsupportedError catch (e) {
    print('Fehler gefangen: ${e.message}');
  } catch (e) {
    print('Unerwarteter Fehler: $e');
  } finally {
    print('Fehlerbehandlung abgeschlossen');
  }
}

// Funktion mit Fehlerbehandlung
int berechneDividition(int a, int b) {
  if (b == 0) {
    throw UnsupportedError('Division durch Null ist nicht erlaubt');
  }
  return a ~/ b;
}

// Zusätzliche fortgeschrittene Konzepte
class GenericRepository<T> {
  final List<T> _items = [];

  void hinzufuegen(T item) {
    _items.add(item);
  }

  T? holen(int index) {
    return index < _items.length ? _items[index] : null;
  }

  List<T> getAlleItems() {
    return List.unmodifiable(_items);
  }
}

void zeigeGenerischeKlasse() {
  print('\n--- Generische Klasse ---');

  var stringRepo = GenericRepository<String>();
  stringRepo.hinzufuegen('Hallo');
  stringRepo.hinzufuegen('Welt');

  print(stringRepo.getAlleItems());

  var intRepo = GenericRepository<int>();
  intRepo.hinzufuegen(42);
  intRepo.hinzufuegen(7);

  print(intRepo.getAlleItems());
}