import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text('Menu'),
            decoration: BoxDecoration(
              color: Colors.cyan[800],
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('Tutorial & FAQs'),
            onTap: () {
              _navigateToDummyPage(context, 'Tutorial & FAQs');
            },
          ),

          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('Contact Us'),
            onTap: () {
              _navigateToDummyPage(context, 'Contact Us');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
            onTap: () {
              _navigateToDummyPage(context, 'Log Out');
            },
          ),
        ],
      ),
    );
  }


  void _navigateToDummyPage(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DummyPage(title)),
    );
  }
}

class DummyPage extends StatelessWidget {
  final String title;

  DummyPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('This is the $title page'),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atmata Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Vertically center
          crossAxisAlignment: CrossAxisAlignment.center, // Horizontally center
          children: [
            Text('---', style: TextStyle(fontSize: 24)),
            Text('Hours', style: TextStyle(fontSize: 18, color: Colors.grey)),
            SizedBox(height: 10),
            Text('---', style: TextStyle(fontSize: 24)),
            Text('Distance', style: TextStyle(fontSize: 18, color: Colors.grey)),
            SizedBox(height: 10),
            Text('---', style: TextStyle(fontSize: 24)),
            Text('Shots', style: TextStyle(fontSize: 18, color: Colors.grey)),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.devices),
              title: Text('Device Management'),
              onTap: () {
                // Implement Device Management page
              },
            ),
            ListTile(
              leading: Icon(Icons.forum),
              title: Text('Atmata Forum'),
              onTap: () {
                // Implement Atmata Forum page
              },
            ),
            ListTile(
              leading: Icon(Icons.store),
              title: Text('Atmata Store'),
              onTap: () {
                // Implement Atmata Store page
              },
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('Service and Support'),
              onTap: () {
                // Implement Service and Support page
              },
            ),
          ],
        ),
      ),
    );
  }
}