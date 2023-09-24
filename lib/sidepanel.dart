import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class SidePanel extends StatelessWidget {
  final List<Map<String, dynamic>> statistics = [
    {
      'title': 'Battery Level',
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
      'value': '(x: 0, y: 0, z: 0)',
      'isBattery': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoButton.filled(
            onPressed: () {
              _showMovementOptions(context);
            },
            child: Row(
              children: [
                Icon(Icons.settings_applications),
                SizedBox(width: 5),
                Expanded(child: Text('Pre-programmed Control')),
              ],
            ),
            padding: EdgeInsets.all(16),
          ),
          SizedBox(height: 10),
          CupertinoButton.filled(
            onPressed: () {
              _showNotification(context, "Operate Using Joystick");
            },
            child: Row(
              children: [
                Icon(Icons.videogame_asset),
                SizedBox(width: 5),
                Expanded(child: Text('Manual Control')),
              ],
            ),
            padding: EdgeInsets.all(16),
          ),
          SizedBox(height: 10),
          CupertinoButton.filled(
            onPressed: () {
              _showNotification(context, "There are no movements in the camera pool.");
            },
            child: Row(
              children: [
                Icon(Icons.repeat),
                SizedBox(width: 5),
                Expanded(child: Text('Repeat Camera Motion')),
              ],
            ),
            padding: EdgeInsets.all(16),
          ),
          SizedBox(height: 20),
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
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  )
                      : Text(stat['value']),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showMovementOptions(BuildContext context) {

    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('Select a Movement/Trajectory'),
          actions: <Widget>[
            _actionSheetOption(context, 'Dolly'),
            _actionSheetOption(context, 'Pan'),
            _actionSheetOption(context, 'Pull In'),
            _actionSheetOption(context, 'Pull Out'),
            _actionSheetOption(context, 'Circle'),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  CupertinoActionSheetAction _actionSheetOption(BuildContext context, String option) {
    return CupertinoActionSheetAction(
      child: Text(option),
      onPressed: () {
        Navigator.pop(context);
        _showNotification(context, "$option Movement Executed");
      },
    );
  }

  void _showNotification(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Notification'),
          content: Text(message),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}