import 'package:flutter/material.dart';

void main() {
  runApp(MyFlutterBuildingBlocksApp());
}

// 1. Stateless Widget Example
class MyFlutterBuildingBlocksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

// 2. Stateful Widget Example
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // State management example
  int _counter = 0;
  bool _isLoading = false;

  // 3. State Update Method
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // 4. Async Operation Example
  Future<void> _simulateLoading() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 5. AppBar Widget
      appBar: AppBar(
        title: Text('Flutter Building Blocks'),
        actions: [
          // 6. IconButton Example
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _simulateLoading,
          )
        ],
      ),

      // 7. Body with Multiple Widgets
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 8. Conditional Rendering
            if (_isLoading)
              CircularProgressIndicator()
            else
              Text(
                'Counter Value: $_counter',
                style: TextStyle(fontSize: 20),
              ),

            // 9. Elevated Button with Styling
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text('Increment'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.green,
              ),
            ),

            // 10. List View Example
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item $index'),
                    subtitle: Text('Description for item $index'),
                    leading: Icon(Icons.star),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // 11. Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: _simulateLoading,
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),

      // 12. Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

// 13. Custom Widget Example
class CustomCard extends StatelessWidget {
  final String title;
  final String description;

  const CustomCard({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(description),
          ],
        ),
      ),
    );
  }
}