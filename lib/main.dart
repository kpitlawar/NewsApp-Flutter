import 'package:flutter/material.dart';
import 'package:newsApp/views/home.dart';

void main() {
  runApp(MaterialApp(
    title: 'News App',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.white
    ),
    home: Home(),
  
  ));
}