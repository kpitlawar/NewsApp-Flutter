import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings',
      style: TextStyle(color: Colors.white),
      ),
      elevation: 0.0,
      backgroundColor: Colors.blue,
      ),
      body: 
      Center(child: Text('In Settings Screen ')),
    );
  }
}