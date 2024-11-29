import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Box Constraints Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BoxConstraintsDemo(),
    );
  }
}

class BoxConstraintsDemo extends StatelessWidget {
  const BoxConstraintsDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Box Constraints Beispiele'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Beispiel 1: Feste Größe
              const Text('1. Container mit fester Größe:'),
              Container(
                width: 200,
                height: 100,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Feste Größe',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Beispiel 2: Flexible Größe
              const Text('2. Container mit flexibler Größe:'),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 100,
                  maxWidth: 300,
                  minHeight: 50,
                  maxHeight: 150,
                ),
                child: Container(
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      'Flexible Größe',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Beispiel 3: Expanded Widget
              const Text('3. Expanded Widget in Row:'),
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.red,
                        child: const Center(
                          child: Text(
                            'Flex: 2',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.orange,
                        child: const Center(
                          child: Text(
                            'Flex: 1',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Beispiel 4: AspectRatio
              const Text('4. AspectRatio Widget:'),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.purple,
                  child: const Center(
                    child: Text(
                      '16:9 Verhältnis',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Beispiel 5: FractionallySizedBox
              const Text('5. FractionallySizedBox:'),
              SizedBox(
                width: double.infinity,
                height: 100,
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  heightFactor: 0.5,
                  child: Container(
                    color: Colors.teal,
                    child: const Center(
                      child: Text(
                        '80% Breite, 50% Höhe',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
