import 'package:flutter/material.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(title: Text('More',
      style: TextStyle(color: Colors.white),
      ),
      elevation: 0.0,
      backgroundColor: Colors.blue,
      ),
      body: 
      Center(child: Text('In More Screen ')),
    );
  }
}