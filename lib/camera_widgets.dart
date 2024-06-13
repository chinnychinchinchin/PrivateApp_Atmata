import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'real_time_stats.dart';
import 'sidepanel.dart';
import 'main.dart';

class CameraFeedWithFloatingButtons extends StatefulWidget {
  @override
  _CameraFeedWithFloatingButtonsState createState() =>
      _CameraFeedWithFloatingButtonsState();
}

class _CameraFeedWithFloatingButtonsState
    extends State<CameraFeedWithFloatingButtons> {
  bool _showButtons = false;
  bool _showStats = false;
  bool _showSidePanel = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onVerticalDragUpdate: (details) {
            if (details.delta.dy > 0) {
              // Swiping down
              setState(() {
                _showButtons = false;
              });
            } else if (details.delta.dy < 0) {
              // Swiping up
              setState(() {
                _showButtons = true;
              });
            }
          },
          child: CameraFeed(),
        ),
        if (_showButtons)
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
        if (_showStats)
          Positioned.fill(
            child: Stack(
              children: [
                RealTimeStats(),
                Positioned(
                  top: 16,
                  right: 16,
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        _showStats = false;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        if (_showSidePanel)
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: SidePanel(
              onClose: () {
                setState(() {
                  _showSidePanel = false;
                });
              },
            ),
          ),
        if (!_showSidePanel && !_showStats)
          Positioned(
            top: 16,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                setState(() {
                  _showSidePanel = true;
                });
              },
            ),
          ),
        if (!_showStats && !_showSidePanel)
          Positioned(
            top: 16,
            right: 16,
            child: IconButton(
              icon: Icon(Icons.bar_chart, color: Colors.white),
              onPressed: () {
                setState(() {
                  _showStats = true;
                });
              },
            ),
          ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => WelcomeScreen(),
              ));
            },
            child: Icon(Icons.help),
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
          image: NetworkImage('https://picsum.photos/800/600?random'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
