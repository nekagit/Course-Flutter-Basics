import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Caching Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DataCachingPage(),
    );
  }
}

class DataCachingPage extends StatefulWidget {
  @override
  _DataCachingPageState createState() => _DataCachingPageState();
}

class _DataCachingPageState extends State<DataCachingPage> {
  String _cachedData = "No cached data";

  // Method to load cached data from SharedPreferences
  Future<void> _loadCachedData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _cachedData = prefs.getString('cached_data') ?? "No cached data";
    });
  }

  // Method to cache new data into SharedPreferences
  Future<void> _cacheData(String data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('cached_data', data);
    setState(() {
      _cachedData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    // Load cached data when the page loads
    _loadCachedData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Caching Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the cached data
            Text(
              'Cached Data: $_cachedData',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),

            // Button to simulate caching new data
            ElevatedButton(
              onPressed: () {
                _cacheData('This is some new cached data!');
              },
              child: Text('Cache New Data'),
            ),
            SizedBox(height: 20),

            // Button to simulate loading cached data
            ElevatedButton(
              onPressed: _loadCachedData,
              child: Text('Load Cached Data'),
            ),
          ],
        ),
      ),
    );
  }
}
