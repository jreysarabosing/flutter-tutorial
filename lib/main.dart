import 'package:flutter/material.dart';
import 'package:tutorial/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(App());
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

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      this.setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      this.setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initalization failed
    if (_error) {
      return Container(
        child: Text(
          'Error initalizing Firebase.',
          style: TextStyle(color: Colors.red, fontSize: 20),
          textDirection: TextDirection.ltr,
        ),
      ); //TODO make error page
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Container(
        child: Text(
          'Initializing Firebase...',
          style: TextStyle(color: Colors.lime, fontSize: 20),
          textDirection: TextDirection.ltr,
        ),
      ); //TODO make loading page
    }

    return MyApp();
  }
}
