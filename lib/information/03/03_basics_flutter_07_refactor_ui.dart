import 'package:flutter/material.dart';

void main() {
  runApp(DesignBreakdownApp());
}

// 1. Main App Structure
class DesignBreakdownApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design Breakdown Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProfileScreen(),
    );
  }
}

// 2. Main Screen Widget
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Break down complex UI into smaller, reusable widgets
            UserProfileHeader(),
            UserStatistics(),
            UserActivitySection(),
            UserInteractionButtons(),
          ],
        ),
      ),
    );
  }

  // 3. Custom App Bar Method
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text('User Profile'),
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            // Settings action
          },
        ),
      ],
    );
  }
}

// 4. User Profile Header Widget
class UserProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          _buildProfileAvatar(),
          SizedBox(width: 16),
          _buildUserInfo(),
        ],
      ),
    );
  }

  // 5. Nested Method for Avatar
  Widget _buildProfileAvatar() {
    return CircleAvatar(
      radius: 50,
      backgroundImage: NetworkImage(
        'https://example.com/profile.jpg',
      ),
    );
  }

  // 6. Nested Method for User Info
  Widget _buildUserInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'John Doe',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Mobile App Developer',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          _buildLocationInfo(),
        ],
      ),
    );
  }

  // 7. Nested Method for Location Info
  Widget _buildLocationInfo() {
    return Row(
      children: [
        Icon(Icons.location_on, size: 16, color: Colors.grey),
        SizedBox(width: 4),
        Text(
          'San Francisco, CA',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

// 8. User Statistics Widget
class UserStatistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem('Posts', '156'),
          _buildStatItem('Followers', '4.5K'),
          _buildStatItem('Following', '256'),
        ],
      ),
    );
  }

  // 9. Reusable Statistics Item Method
  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

// 10. User Activity Section Widget
class UserActivitySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Activity',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          _buildActivityList(),
        ],
      ),
    );
  }

  // 11. Activity List Method
  Widget _buildActivityList() {
    return Column(
      children: [
        _buildActivityItem(
          'Created a new project',
          'Flutter Design Breakdown',
          Icons.code,
        ),
        _buildActivityItem(
          'Commented on',
          'UI/UX Design Principles',
          Icons.comment,
        ),
      ],
    );
  }

  // 12. Reusable Activity Item Method
  Widget _buildActivityItem(String action, String details, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(action),
      subtitle: Text(details),
      trailing: Text('2h ago'),
    );
  }
}

// 13. User Interaction Buttons Widget
class UserInteractionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          _buildInteractionButton(
            'Message',
            Icons.message,
            Colors.blue,
                () {
              // Message action
            },
          ),
          SizedBox(width: 16),
          _buildInteractionButton(
            'Follow',
            Icons.person_add,
            Colors.green,
                () {
              // Follow action
            },
          ),
        ],
      ),
    );
  }

  // 14. Reusable Interaction Button Method
  Widget _buildInteractionButton(
      String text,
      IconData icon,
      Color color,
      VoidCallback onPressed,
      ) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}