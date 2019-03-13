import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friendlychat',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Friendlychat'),
        ),
      ),
    );
  }
}
