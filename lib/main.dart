import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_demo/screens/home/home-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SAK4e',
      theme: ThemeData(
        primaryColor: Colors.lightGreenAccent,
      ),
      home: HomeScreen()
    );
  }
}