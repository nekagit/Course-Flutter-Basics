import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Widget? customChild;

  const CustomCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.customChild,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(icon, size: 50, color: Colors.blue),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        description,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (customChild != null) ...[
              SizedBox(height: 16),
              customChild!,
            ],
          ],
        ),
      ),
    );
  }
}

// Example usage:
class ExampleUsage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Example Title',
      description: 'Example Description',
      icon: Icons.star,
      customChild: ElevatedButton(
        onPressed: () {},
        child: Text('Custom Button'),
      ),
    );
  }
}
