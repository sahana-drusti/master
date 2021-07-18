import 'package:drusti/Add.dart';
import 'package:drusti/CreateStaff.dart';
import 'package:drusti/CreateStudent.dart';
import 'package:drusti/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MyProfile.dart';

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyProfile()),
        );
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
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          createContainer(addDetails("Add Student",CreateStudent()), 150.0),
          createContainer(addDetails("Add Staff", CreateStaff()), 150.0),
          createContainer(addDetails("Add", CreateAdd()), 150.0),
        ],
      )),
    );
  }

  createContainer(details, double d) {
    return (Center(
      child: Container(
        margin: EdgeInsets.only(top: 20.0),
        color: Colors.transparent,
        height: d,
        width: 350.0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: details,
        ),
      ),
    ));
  }

  addDetails( String s, Widget w) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only( top: 25.0),
            child: Column(children: [
              Text(
                s,
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          Container(
            margin : EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (builder) => w));
              },
              icon: Icon(
                Icons.add_circle_outline_sharp,

              ),
              alignment: Alignment.center,
            ),
          ),

        ],
      ),
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
