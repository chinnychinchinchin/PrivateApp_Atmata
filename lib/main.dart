import 'package:flutter/material.dart';
import 'workstation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.cyan[800]!,
        colorScheme: ColorScheme.dark(
          primary: Colors.cyan[800]!,
          secondary: Colors.cyan[800]!,
        ),
      ),
      home: WorkstationPage(),
    );
  }
}




