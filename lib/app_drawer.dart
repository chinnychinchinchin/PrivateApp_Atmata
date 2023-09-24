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
              _navigateToDummyPage(context, 'Profile');
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