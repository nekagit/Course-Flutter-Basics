import 'package:flutter/material.dart';

// Parent widget to demonstrate lifecycle events
class LifecycleParent extends StatefulWidget {
  const LifecycleParent({super.key});

  @override
  State<LifecycleParent> createState() => _LifecycleParentState();
}

class _LifecycleParentState extends State<LifecycleParent> {
  bool _showChild = true;
  int _counter = 0;

  void _toggleChild() {
    setState(() {
      _showChild = !_showChild;
    });
  }

  void _updateCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _toggleChild,
          child: Text(_showChild ? 'Hide Child' : 'Show Child'),
        ),
        ElevatedButton(
          onPressed: _updateCounter,
          child: const Text('Update Counter'),
        ),
        if (_showChild)
          LifecycleDemo(
            counter: _counter,
          ),
      ],
    );
  }
}

// Main lifecycle demonstration widget
class LifecycleDemo extends StatefulWidget {
  final int counter;

  const LifecycleDemo({
    super.key,
    required this.counter,
  });

  @override
  State<LifecycleDemo> createState() {
    print('1. createState: Initial state creation');
    return _LifecycleDemoState();
  }
}

class _LifecycleDemoState extends State<LifecycleDemo> {
  late String _data;

  // 1. Constructor
  _LifecycleDemoState() {
    print('2. Constructor: State class is instantiated');
  }

  // 2. initState
  @override
  void initState() {
    super.initState();
    print('3. initState: Widget is inserted into widget tree');
    _data = 'Initial data';
    // Simulate async initialization
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _data = 'Data loaded';
        });
      }
    });
  }

  // 3. didChangeDependencies
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('4. didChangeDependencies: Dependencies changed');
    // Example: Access inherited widgets
    Theme.of(context);
  }

  // 4. didUpdateWidget
  @override
  void didUpdateWidget(LifecycleDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('5. didUpdateWidget: Widget configuration updated');
    if (oldWidget.counter != widget.counter) {
      print('Counter changed from ${oldWidget.counter} to ${widget.counter}');
    }
  }

  // 5. build
  @override
  Widget build(BuildContext context) {
    print('6. build: Widget is built/rebuilt');
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Lifecycle Demo Widget'),
            Text('Counter: ${widget.counter}'),
            Text('Data: $_data'),
          ],
        ),
      ),
    );
  }

  // 6. deactivate
  @override
  void deactivate() {
    print('7. deactivate: State is temporarily removed from widget tree');
    super.deactivate();
  }

  // 7. dispose
  @override
  void dispose() {
    print('8. dispose: State object is permanently removed');
    super.dispose();
  }
}

// Example usage in a main app
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Widget Lifecycle Demo'),
        ),
        body: const Center(
          child: LifecycleParent(),
        ),
      ),
    ),
  );
}

// Optional: State restoration example
class RestorationLifecycleDemo extends StatefulWidget {
  const RestorationLifecycleDemo({super.key});

  @override
  State<RestorationLifecycleDemo> createState() => _RestorationLifecycleDemoState();
}

class _RestorationLifecycleDemoState extends State<RestorationLifecycleDemo>
    with RestorationMixin {
  // Restoration
  @override
  String? get restorationId => 'lifecycle_demo';

  final RestorableInt _counter = RestorableInt(0);

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Restorable Counter: ${_counter.value}');
  }
}