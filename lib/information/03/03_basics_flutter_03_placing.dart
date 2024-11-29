import 'package:flutter/material.dart';

void main() {
  runApp(PlacementAndAlignmentApp());
}

class PlacementAndAlignmentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Placements and Alignments',
      home: AlignmentDemoScreen(),
    );
  }
}

class AlignmentDemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Placements and Alignments'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Center Placement
            _buildSectionTitle('Center Placement'),
            Container(
              height: 200,
              color: Colors.blue.shade100,
              child: Center(
                child: Text(
                  'Centered Content',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            // 2. Column Alignment
            _buildSectionTitle('Column Alignment'),
            Container(
              height: 200,
              color: Colors.green.shade100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Top'),
                  Text('Middle'),
                  Text('Bottom'),
                ],
              ),
            ),

            // 3. Row Alignment
            _buildSectionTitle('Row Alignment'),
            Container(
              height: 100,
              color: Colors.red.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.home),
                  Icon(Icons.search),
                  Icon(Icons.settings),
                ],
              ),
            ),

            // 4. Stack Positioning
            _buildSectionTitle('Stack Positioning'),
            Container(
              height: 250,
              color: Colors.purple.shade100,
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Text('Top Left'),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Text('Top Right'),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text('Bottom Left'),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Text('Bottom Right'),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text('Centered'),
                    ),
                  ),
                ],
              ),
            ),

            // 5. Alignment with Expanded Widgets
            _buildSectionTitle('Expanded Widgets'),
            Container(
              height: 150,
              color: Colors.orange.shade100,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.blue,
                      child: Center(child: Text('2x Space')),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.green,
                      child: Center(child: Text('1x Space')),
                    ),
                  ),
                ],
              ),
            ),

            // 6. Alignment with Flex and Spacer
            _buildSectionTitle('Flex and Spacer'),
            Container(
              height: 100,
              color: Colors.teal.shade100,
              child: Row(
                children: [
                  Icon(Icons.account_circle, size: 50),
                  Spacer(),
                  Icon(Icons.settings, size: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create section titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}