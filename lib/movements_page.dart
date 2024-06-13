import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MovementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movements'),
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
                icon: Icon(Icons.pan_tool, size: 40),
                label: Text(
                  'Pan',
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  primary: Colors.blue[800],
                ),
                onPressed: () {
                  _showMovementNotification(context, 'Pan');
                },
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ElevatedButton.icon(
                icon: Icon(Icons.directions, size: 40),
                label: Text(
                  'Dolly',
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  primary: Colors.blue[800],
                ),
                onPressed: () {
                  _showMovementNotification(context, 'Dolly');
                },
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ElevatedButton.icon(
                icon: Icon(Icons.threed_rotation, size: 40),
                label: Text(
                  'Tilt',
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  primary: Colors.blue[800],
                ),
                onPressed: () {
                  _showMovementNotification(context, 'Tilt');
                },
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ElevatedButton.icon(
                icon: Icon(Icons.zoom_in, size: 40),
                label: Text(
                  'Zoom In',
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  primary: Colors.blue[800],
                ),
                onPressed: () {
                  _showMovementNotification(context, 'Zoom In');
                },
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ElevatedButton.icon(
                icon: Icon(Icons.zoom_out, size: 40),
                label: Text(
                  'Zoom Out',
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  primary: Colors.blue[800],
                ),
                onPressed: () {
                  _showMovementNotification(context, 'Zoom Out');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMovementNotification(BuildContext context, String movement) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Movement Selected'),
          content: Text('Proceed with shot?'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        );
      },
    );
  }
}
