import 'package:flutter/material.dart';
import 'workstation.dart';

class TrajectoryDetailsPage extends StatelessWidget {
  final String title;
  final String parameter;

  TrajectoryDetailsPage({required this.title, required this.parameter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => WorkstationPage()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: '$parameter (in meters)',
              ),
              keyboardType: TextInputType.number,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => WorkstationPage()));
              },
              child: Text('Start Shot'),
            ),
          ],
        ),
      ),
    );
  }
}
