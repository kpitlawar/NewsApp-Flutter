import 'package:flutter/material.dart';
import 'package:newsApp/views/home.dart';
import 'package:newsApp/views/more.dart';
import 'package:newsApp/views/profile.dart';
import 'package:newsApp/views/settings.dart';

void main() {
  runApp(MaterialApp(
    title: 'News App',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.white
    ),
    home: MyBottonNavigator(),
  
  ));
}


 class MyBottonNavigator extends StatefulWidget {
  @override
  _MyBottonNavigatorState createState() => _MyBottonNavigatorState();
}

class _MyBottonNavigatorState extends State<MyBottonNavigator> {

  int _currentIndex = 0;
  final List<Widget> _listWidget = [
    Home(),
    Profile(),
    Settings(),
    More()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
           
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
           
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Setting'),
             
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              title: Text('More'),
             
            ),
            
          ],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey[500],
          onTap: (index){
              setState(() {
                _currentIndex = index;
              });
          },
        ),
    );
  }
}