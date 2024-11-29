import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Lists Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DynamicListsDemo(),
    );
  }
}

class DynamicListsDemo extends StatefulWidget {
  const DynamicListsDemo({super.key});

  @override
  State<DynamicListsDemo> createState() => _DynamicListsDemoState();
}

class _DynamicListsDemoState extends State<DynamicListsDemo> {
  // List of items that can be modified
  final List<String> _items = ['Item 1', 'Item 2', 'Item 3'];

  // List of custom objects
  final List<TodoItem> _todos = [
    TodoItem(title: 'Buy groceries', isDone: false),
    TodoItem(title: 'Walk the dog', isDone: true),
    TodoItem(title: 'Learn Flutter', isDone: false),
  ];

  // Controller for new item text field
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dynamic Lists Examples'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Basic List'),
              Tab(text: 'Todo List'),
              Tab(text: 'Grid List'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildBasicList(),
            _buildTodoList(),
            _buildGridList(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showAddItemDialog,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  // Basic list with remove functionality
  Widget _buildBasicList() {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ListTile(
            title: Text(_items[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _items.removeAt(index);
                });
              },
            ),
          ),
        );
      },
    );
  }

  // Todo list with checkboxes
  Widget _buildTodoList() {
    return ListView.builder(
      itemCount: _todos.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ListTile(
            leading: Checkbox(
              value: _todos[index].isDone,
              onChanged: (bool? value) {
                setState(() {
                  _todos[index].isDone = value ?? false;
                });
              },
            ),
            title: Text(
              _todos[index].title,
              style: TextStyle(
                decoration: _todos[index].isDone
                    ? TextDecoration.lineThrough
                    : null,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _todos.removeAt(index);
                });
              },
            ),
          ),
        );
      },
    );
  }

  // Grid list example
  Widget _buildGridList() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.blue[100],
          child: InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tapped ${_items[index]}')),
              );
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _items[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Dialog to add new items
  void _showAddItemDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Item'),
          content: TextField(
            controller: _textController,
            decoration: const InputDecoration(
              hintText: 'Enter item text',
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _textController.clear();
              },
              child: const Text('CANCEL'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (_textController.text.isNotEmpty) {
                    _items.add(_textController.text);
                    _todos.add(TodoItem(
                      title: _textController.text,
                      isDone: false,
                    ));
                  }
                });
                Navigator.pop(context);
                _textController.clear();
              },
              child: const Text('ADD'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

// Custom class for todo items
class TodoItem {
  String title;
  bool isDone;

  TodoItem({
    required this.title,
    required this.isDone,
  });
}