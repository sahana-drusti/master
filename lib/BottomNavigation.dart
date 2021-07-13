import 'package:drusti/Add.dart';
import 'package:drusti/Calendar.dart';
import 'package:drusti/CreateStaff.dart';
import 'package:drusti/CreateStudent.dart';
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
                      height: 220,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('CREATE',style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),),
                            Divider(
                              color: Colors.black,
                            ),
                            TextButton.icon(
                              icon: Icon(Icons.add,size: 40,color: Colors.black,),
                              label:Text('Create student',style: TextStyle(color: Colors.black, fontSize: 20),),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (builder) => CreateStudent()));
                              },
                            ),
                            TextButton.icon(
                              icon: Icon(Icons.add,size: 40,color: Colors.black,),
                              label: Text('Create staff',style: TextStyle(color: Colors.black,fontSize: 20),),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (builder) => CreateStaff()));
                              },
                            ),
                            TextButton.icon(

                              icon: Icon(Icons.add,size: 40,color: Colors.black,),
                              label: Text('Create/Add',style: TextStyle(color: Colors.black,fontSize: 20),),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (builder) => CreateAdd()));
                              },
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
    Home(),
    Notifications(),
    Calendar(),
  ];
  onSelectingItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
