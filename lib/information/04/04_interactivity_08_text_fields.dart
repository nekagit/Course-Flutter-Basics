import 'package:flutter/material.dart';

void main() {
  runApp(const MultiLineTextFieldApp());
}

class MultiLineTextFieldApp extends StatelessWidget {
  const MultiLineTextFieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MultiLineTextFieldScreen(),
    );
  }
}

class MultiLineTextFieldScreen extends StatefulWidget {
  const MultiLineTextFieldScreen({super.key});

  @override
  _MultiLineTextFieldScreenState createState() => _MultiLineTextFieldScreenState();
}

class _MultiLineTextFieldScreenState extends State<MultiLineTextFieldScreen> {
  final TextEditingController _controller = TextEditingController();
  String _submittedText = "";

  void _submitText() {
    setState(() {
      _submittedText = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi-line Text Field"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 5, // Allows the text field to expand to 5 lines
              decoration: InputDecoration(
                labelText: "Enter multi-line text",
                hintText: "Type your message here...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitText,
              child: const Text("Submit"),
            ),
            const SizedBox(height: 20),
            Text(
              "Submitted Text:",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(_submittedText),
          ],
        ),
      ),
    );
  }
}
