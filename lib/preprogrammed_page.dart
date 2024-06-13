import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Add this line
import 'trajectories_page.dart';
import 'movements_page.dart';

class PreprogrammedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preprogrammed Trajectories/Movements'),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ElevatedButton.icon(
                icon: Icon(Icons.directions_walk, size: 40),
                label: Text(
                  'Trajectories',
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  primary: Colors.cyan[800],
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TrajectoriesPage(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ElevatedButton.icon(
                icon: Icon(Icons.videocam, size: 40),
                label: Text(
                  'Movements',
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  primary: Colors.cyan[800],
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MovementsPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

