import 'package:flutter/material.dart';

class DynamicList extends StatefulWidget {
  const DynamicList({super.key});

  @override
  State<DynamicList> createState() => _DynamicListState();
}

class _DynamicListState extends State<DynamicList> {
  final List<String> _items = ['item1', 'item2', 'item3'];
  final List<TodoItem> _todos = [
    TodoItem(title: 'Einkaufen', isDone: false),
    TodoItem(title: 'Lernen', isDone: false),
    TodoItem(title: 'Trainieren', isDone: false)
  ];
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dynamic List Examples'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Basic List'),
              Tab(text: 'Todo List'),
            ],
          ),
        ),
        body: TabBarView(children: [
          _basicList(),
          _todoList(),
        ]),
      ),
    );
  }

  Widget _todoList() {
    return ListView.builder(
      itemCount: _todos.length,
      itemBuilder: (context, index) {
        return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ListTile(
              leading: Checkbox(
                  value: _todos[index].isDone,
                  onChanged: (bool? value) {
                    setState(() {
                      _todos[index].isDone = value ?? false;
                    });
                  }),
              title: Text(_todos[index].title),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    _todos.removeAt(index);
                  });
                },
                icon: const Icon(Icons.delete),
              ),
            ));
      },
    );
  }

  Widget _basicList() {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ListTile(
              title: Text(_items[index]),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    _items.removeAt(index);
                  });
                },
                icon: const Icon(Icons.delete),
              ),
            ));
      },
    );
  }
/*Widget _basicList() {    return ListView.builder(      itemCount: _items.length,      itemBuilder: (context, index) {        return Card(            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),            child: ListTile(              title: Text(_items[index]),              trailing: IconButton(                onPressed: () {                  setState(() {                    _items.removeAt(index);                  });                },                icon: const Icon(Icons.delete),              ),            ));      },    );  }*/
}

class TodoItem {
  String title;
  bool isDone;

  TodoItem({required this.title, required this.isDone});
}
