import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        title: Text('Profile',
        style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        elevation: 0.0,
      ),
      body: 
      Center(child: Text('In Profile Screen ')),
      
    );
  }
}
