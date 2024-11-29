import 'package:flutter/material.dart';

void main() {
  runApp(const DatenTypenDemo());
}

class DatenTypenDemo extends StatelessWidget {
  const DatenTypenDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Datentypen in Dart/Flutter'),
        ),
        body: const DatenTypenBeispiele(),
      ),
    );
  }
}

class DatenTypenBeispiele extends StatelessWidget {
  const DatenTypenBeispiele({super.key});

  void zeigeZahlenBeispiele() {
    // Integer (Ganzzahlen)
    int ganzeZahl = 42;
    int negativeZahl = -17;

    // Double (Fließkommazahlen)
    double kommaZahl = 3.14;
    double wissenschaftlicheNotation = 1.2e4; // 12000

    // Num (kann sowohl int als auch double sein)
    num flexibleZahl1 = 100;    // int
    num flexibleZahl2 = 100.5;  // double

    // Mathematische Operationen
    int summe = 5 + 3;
    int differenz = 10 - 4;
    double produkt = 6 * 7.5;
    double quotient = 15 / 2;
    int rest = 17 % 5;

    // Ausgabe der Zahlen
    print('Ganzzahl: $ganzeZahl');
    print('Negative Zahl: $negativeZahl');
    print('Kommazahl: $kommaZahl');
    print('Wissenschaftliche Notation: $wissenschaftlicheNotation');
  }

  void zeigeStringBeispiele() {
    // String-Deklaration
    String einfacherString = 'Hallo Welt';
    String doppelteAnfuehrung = "Auch ein String";

    // Mehrzeilige Strings
    String mehrzeilig = '''
      Dies ist ein
      mehrzeiliger String
      in Dart.
    ''';

    // String-Konkatenation
    String vorname = 'Max';
    String nachname = 'Mustermann';
    String vollstndigerName = vorname + ' ' + nachname;

    // String Interpolation
    String alter = '30';
    String info = 'Name: $vollstndigerName, Alter: $alter';

    // String-Methoden
    String beispielText = 'Dart ist super!';
    int lnge = beispielText.length;
    String grobuchstaben = beispielText.toUpperCase();
    String kleinbuchstaben = beispielText.toLowerCase();
    bool enthltDart = beispielText.contains('Dart');
    String ersetzterText = beispielText.replaceAll('super', 'fantastisch');
    List<String> wrter = beispielText.split(' ');

    // Ausgabe der String-Operationen
    print('Länge: $lnge');
    print('Großbuchstaben: $grobuchstaben');
    print('Enthält "Dart": $enthltDart');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Zahlen (Numbers)',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text('''
• int: Ganzzahlen (42, -17)
• double: Fließkommazahlen (3.14, 1.2e4)
• num: Flexible Zahlentypen
          '''),
          const SizedBox(height: 20),
          const Text(
            'Strings',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text('''
• Einfache Strings mit '' oder ""
• Mehrzeilige Strings mit ''' ''' oder """
• String-Interpolation mit \$variable oder \${ausdruck}
• Verschiedene String-Methoden (length, toUpperCase(), toLowerCase(), etc.)
          '''),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              zeigeZahlenBeispiele();
              zeigeStringBeispiele();
            },
            child: const Text('Beispiele in Konsole ausgeben'),
          ),
        ],
      ),
    );
  }
}