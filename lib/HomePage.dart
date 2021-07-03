import 'package:drusti/LoginAndRegistration.dart';
import 'package:drusti/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatelessWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State {
  void handleClick(String value) {
    switch (value) {
      case 'Profile':
        break;
      case 'Settings':
        break;
      case 'Logout':
        logOut();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        backgroundColor: Colors.white,
        title: Text('Homepage'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Profile', 'Settings', 'Logout'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(


          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: deviceHeight * 0.25,
                  width: deviceWidth * 0.90,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.black),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'ADD STUDENT',
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 30),
                      ),
                      IconButton(
                        alignment: Alignment.center,
                        icon: Icon(Icons.add_circle_outline_sharp, size: 50),
                        color: Colors.white,
                        onPressed: () {
                          print("You Pressed the icon!");
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: deviceHeight * 0.25,
                  width: deviceWidth * 0.90,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.black),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'ADD LECTURE',
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 30),
                      ),
                      IconButton(
                        alignment: Alignment.topRight,
                        icon: Icon(Icons.add_circle_outline_sharp, size: 50),
                        color: Colors.white,
                        onPressed: () {
                          print("You Pressed the icon!");
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: deviceHeight * 0.25,
                  width: deviceWidth * 0.90,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.black),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'ADD ',
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      IconButton(
                        alignment: Alignment.topRight,
                        icon: Icon(Icons.add_circle_outline_sharp, size: 50),
                        color: Colors.white,
                        onPressed: () {
                          print("You Pressed the icon!");
                        },
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
      /* drawer: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            DrawerHeader(
              child: Container(
                  height: 142,
                  width: MediaQuery.of(context).size.width,
                  ),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {});
                Navigator.of(context).pop();
              },
              child: Text(
                'Profile',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Calender',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Text(
              'Announcement',
              style: TextStyle(
                fontFamily: 'Avenir',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 45,
            ),
            Text(
              'Log Out',
              style: TextStyle(
                fontFamily: 'Avenir',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 45,
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: Center(
                  child: Text(
                    'DRUSTI',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 20,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ))
          ],
        ),
      ),*/
    );
  }

  Future<void> logOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    pref.commit();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  }
}
