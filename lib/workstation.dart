import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'camera_widgets.dart';
import 'sidepanel.dart';
import 'app_drawer.dart';


class WorkstationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workstation'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {},
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(child: SidePanel()),
                ),
                Expanded(
                  flex: 4,
                  child: CameraFeedWithFloatingButtons(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

