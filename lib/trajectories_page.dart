import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TrajectoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trajectories'),
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
                icon: Icon(Icons.arrow_upward, size: 40),
                label: Text(
                  'Straight Line Forward',
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  primary: Colors.green[800],
                ),
                onPressed: () {
                  _showDistancePage(context, 'Straight Line Forward');
                },
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ElevatedButton.icon(
                icon: Icon(Icons.arrow_downward, size: 40),
                label: Text(
                  'Straight Line Backward',
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  primary: Colors.green[800],
                ),
                onPressed: () {
                  _showDistancePage(context, 'Straight Line Backward');
                },
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ElevatedButton.icon(
                icon: Icon(Icons.circle, size: 40),
                label: Text(
                  'Circle',
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  primary: Colors.green[800],
                ),
                onPressed: () {
                  _showRadiusPage(context, 'Circle');
                },
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ElevatedButton.icon(
                icon: Icon(Icons.show_chart, size: 40),
                label: Text(
                  'Curved Line',
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  primary: Colors.green[800],
                ),
                onPressed: () {
                  _showRadiusPage(context, 'Curved Line');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDistancePage(BuildContext context, String trajectory) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DistancePage(trajectory: trajectory),
      ),
    );
  }

  void _showRadiusPage(BuildContext context, String trajectory) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RadiusPage(trajectory: trajectory),
      ),
    );
  }
}

class DistancePage extends StatelessWidget {
  final String trajectory;

  DistancePage({required this.trajectory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$trajectory - Set Distance'),
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
            TextField(
              decoration: InputDecoration(labelText: 'Distance (m)'),
              keyboardType: TextInputType.number,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: Text('Start Shot'),
            ),
          ],
        ),
      ),
    );
  }
}

class RadiusPage extends StatelessWidget {
  final String trajectory;

  RadiusPage({required this.trajectory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$trajectory - Set Radius'),
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
            TextField(
              decoration: InputDecoration(labelText: 'Radius (m)'),
              keyboardType: TextInputType.number,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: Text('Start Shot'),
            ),
          ],
        ),
      ),
    );
  }
}

