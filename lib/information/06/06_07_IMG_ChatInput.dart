import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Image Input Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  File? _selectedImage;  // Variable to hold the selected image file

  // Function to request permission and pick an image from gallery or camera
  Future<void> _pickImage() async {
    // Request storage and camera permissions (for Android)
    await _requestPermission();

    // Use ImagePicker to select an image
    final ImagePicker picker = ImagePicker();

    // Pick an image from gallery or camera
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);  // Save selected image
      });
    }
  }

  // Function to request camera and gallery permissions
  Future<void> _requestPermission() async {
    final status = await Permission.photos.request();
    if (!status.isGranted) {
      // Show an alert if permission is denied
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Permission to access photos is required')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Image Input'),
      ),
      body: Column(
        children: [
          // Chat Input Area
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Button to pick an image
                IconButton(
                  icon: Icon(Icons.photo),
                  onPressed: _pickImage,
                ),
                // Display the selected image
                if (_selectedImage != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.file(
                      _selectedImage!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                // Text field for typing message
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Chat Messages Section
          Expanded(
            child: ListView(
              children: [
                // Add chat messages here
                ListTile(
                  title: Text('User 1'),
                  subtitle: Text('Hello, how are you?'),
                ),
                ListTile(
                  title: Text('User 2'),
                  subtitle: Text('I\'m good, thanks!'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
