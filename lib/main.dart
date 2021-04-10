import 'package:flutter/material.dart';
import 'example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cards Scroll',
      theme: ThemeData(),
      home: Example()
    );
  }
}

