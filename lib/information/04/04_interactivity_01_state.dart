// 1. Stateless Widget Example - No internal state
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GreetingCard extends StatelessWidget {
  final String name;

  const GreetingCard({
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Hello, $name!');
  }
}

// 2. Stateful Widget Example - Has internal state
class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;  // This is the state

  void _incrementCounter() {
    setState(() {  // Always use setState to update state
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: $_count'),
        ElevatedButton(
          onPressed: _incrementCounter,
          child: const Text('Increment'),
        ),
      ],
    );
  }
}

// 3. Example with State Management using ValueNotifier
class TaskList extends StatelessWidget {
  final ValueNotifier<List<String>> tasks = ValueNotifier<List<String>>([]);

  void addTask(String task) {
    tasks.value = [...tasks.value, task];  // Creating new list triggers rebuild
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<String>>(
      valueListenable: tasks,
      builder: (context, taskList, child) {
        return ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(taskList[index]),
            );
          },
        );
      },
    );
  }
}