import 'package:flutter/material.dart';
import 'package:multirolebase/splashscreen.dart';


void main() {


  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Splashscreen(),

      ),
    );
  }
}




