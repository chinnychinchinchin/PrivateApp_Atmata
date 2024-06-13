import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'trajectory_pool_page.dart';
import 'joystick_instructions_page.dart';
import 'virtual_joystick_instructions_page.dart';
import 'preprogrammed_page.dart';


class SidePanel extends StatelessWidget {
  final VoidCallback onClose;

  SidePanel({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.grey[850],
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Control Modes',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: onClose,
              ),
            ],
          ),
          CupertinoButton.filled(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PreprogrammedPage(),
                ),
              );
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
              _showManualControlOptions(context);
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
              _showRepeatMotionNotification(context);
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
        ],
      ),
    );
  }

  void _showManualControlOptions(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Select One'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Use Virtual Joystick'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => VirtualJoystickInstructionsPage(),
                  ),
                );
              },
            ),
            CupertinoDialogAction(
              child: Text('Connect to your Joystick'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => JoystickInstructionsPage(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _showRepeatMotionNotification(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Notification'),
          content: Text('There are no movements in the camera pool. Do you wish to continue?'),
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
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TrajectoryPoolPage(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

