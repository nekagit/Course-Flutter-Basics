import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Root Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grid in ModalBottomSheet',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const GridModalScreen(),
    );
  }
}

// Main Screen with Button to Show Modal Bottom Sheet
class GridModalScreen extends StatelessWidget {
  const GridModalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid in ModalBottomSheet'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Show the modal bottom sheet with the grid
            showModalBottomSheet(
              context: context,
              isScrollControlled: true, // Allow custom height
              builder: (context) {
                return const GridViewModal();
              },
            );
          },
          child: const Text('Open Grid'),
        ),
      ),
    );
  }
}

// GridView Widget inside ModalBottomSheet
class GridViewModal extends StatelessWidget {
  const GridViewModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        // 2 columns in the grid
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: 20, // Total number of items in the grid
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Show a snack bar when an item is tapped
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tapped item ${index + 1}')),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(8.0),
              ),
              alignment: Alignment.center,
              child: Text(
                'Item ${index + 1}',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          );
        },
      ),
    );
  }
}
