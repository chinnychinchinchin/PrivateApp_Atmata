import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class CameraFeedWithFloatingButtons extends StatefulWidget {
  @override
  _CameraFeedWithFloatingButtonsState createState() =>
      _CameraFeedWithFloatingButtonsState();
}

class _CameraFeedWithFloatingButtonsState
    extends State<CameraFeedWithFloatingButtons> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CameraFeed(),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _floatingButton('2x', () {}, context),
              _floatingButton('3x', () {}, context),
              _floatingButton('4x', () {}, context),
              _floatingButton('Pause', () {
                _showNotification(context, "Movement Paused");
              }, context),
              _floatingButton('Play', () {
                _showNotification(context, "Movement Resumed");
              }, context),
              _floatingButton('Done with Shot', () {
                _showNotification(context, "Trajectory Recorded");
              }, context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _floatingButton(String text, Function onPressed, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: FloatingActionButton.extended(
        onPressed: () => onPressed(),
        label: Text(text),
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.black,
      ),
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

class CameraFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://source.unsplash.com/random'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}