import 'package:drusti/Calendar.dart';
import 'package:drusti/HomePage.dart';
import 'package:drusti/Notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Announcement.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationWidget();
  }
}

class BottomNavigationWidget extends StatefulWidget {
  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends State {
  final rNameController = TextEditingController();
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.announcement),
              label: 'announcement',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(Icons.add_circle_outline_sharp),
              onPressed: () {

                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Create',style: TextStyle(color: Colors.black, fontSize: 20),),

                            TextButton.icon(
                              icon: Icon(Icons.add_circle_outline_sharp,size: 40,color: Colors.black,),
                              label:Text('Create student',style: TextStyle(color: Colors.black, fontSize: 20),),
                              onPressed: (){},
                            ),
                            TextButton.icon(
                              icon: Icon(Icons.add_circle_outline_sharp,size: 40,color: Colors.black,),
                              label: Text('Create staff',style: TextStyle(color: Colors.black,fontSize: 20),),
                              onPressed: (){},
                            ),
                            TextButton.icon(

                              icon: Icon(Icons.camera,size: 40,color: Colors.black,),
                              label: Text('Create/Add',style: TextStyle(color: Colors.black,fontSize: 20),),
                              onPressed: (){},
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            label: 'add action',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'notification',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'calendar',
              backgroundColor: Colors.black),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        onTap: onSelectingItem,
      ),
    ));
  }

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Announcement(),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Notifications(),
    Calendar(),
  ];
  onSelectingItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}