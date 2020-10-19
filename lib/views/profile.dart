import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  @override
  Widget build(BuildContext context) {
   
     return DefaultTabController(
       length: 3,
            child: Scaffold(
        appBar: AppBar(title: Text('Profile',
        style: TextStyle(color: Colors.white),
        ),
        elevation: 0.0,
        backgroundColor: Colors.blue[500],
        bottom: TabBar(
          unselectedLabelColor: Colors.grey[700],
        labelColor: Colors.white,
          tabs: [
          Tab(child: Text('Edit'),
          icon: Icon(Icons.edit, size: 15,),
          
          ),
          Tab(child: Text('Delete'),
          icon: Icon(Icons.delete, size: 15,),
          ),
          Tab(child: Text('New'),
          icon: Icon(Icons.add_circle, size: 15,),

          ),
        ],),
        ),
        body: 
        TabBarView(children: [
          // Container(
          //   child: Text('In Edit'),
          // ),
          //  Container(
          //   child: Text('In Delete'),
          // ),
          //  Container(
          //   child: Text('In New'),
          // ),
          Icon(Icons.edit, size: 30,),
          Icon(Icons.delete, size: 30,),
          Icon(Icons.add_circle, size: 30,)
        ],)
        // Center(child: Text('In Profile Screen ')),
    ),
     );
  }
}
