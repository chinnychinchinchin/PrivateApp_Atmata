import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RealTimeStats extends StatelessWidget {
  final List<Map<String, dynamic>> statistics = [
    {
      'title': 'Battery',
      'value': '70%',
      'isBattery': true,
      'batteryLevel': 0.7,
    },
    {
      'title': 'Connection Status',
      'value': 'Connected',
      'isBattery': false,
    },
    {
      'title': 'Position',
      'value': '(x: 0, y: 0, angle: 0°)',
      'isBattery': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.7),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Real Time Robot Statistics:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: statistics.length,
              itemBuilder: (context, index) {
                var stat = statistics[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(stat['title']),
                    subtitle: stat['isBattery']
                        ? LinearProgressIndicator(
                      value: stat['batteryLevel'],
                      semanticsLabel: 'Battery Level',
                      valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.green),
                    )
                        : Text(stat['value']),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}