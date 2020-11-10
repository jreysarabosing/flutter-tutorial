import 'package:flutter/material.dart';
import 'package:tutorial/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nathan\'s app',
      theme: ThemeData(primarySwatch: Colors.lime),
      home: LoginPage(),
    );
  }
}
