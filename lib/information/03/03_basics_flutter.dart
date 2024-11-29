

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ImportantWidgets());
}

class ImportantWidgets extends StatelessWidget {
  const ImportantWidgets({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        title: 'Important Widgets',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Examples'),
          ),
          body: Center(
            child: Container(
              width:200,
              height: 100,
              color: Colors.amber,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text("Example 1")
                  ),
                  ]
              )
            ),
          ),
        ),
    );
  }
}
