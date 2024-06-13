import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'camera_widgets.dart';
import 'app_drawer.dart';

class WorkstationPage extends StatefulWidget {
  @override
  _WorkstationPageState createState() => _WorkstationPageState();
}

class _WorkstationPageState extends State<WorkstationPage> {
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
        child: CameraFeedWithFloatingButtons(),
      ),
    );
  }
}

