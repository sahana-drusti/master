import 'package:drusti/LoginAndRegistration.dart';
import 'package:drusti/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget{
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

class Home extends StatefulWidget{
  @override
  HomeState createState() =>
    HomeState();

}

class HomeState extends State{
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home here'),
      ),
      body: Container(
        child: TextButton(onPressed: () { 
          logOut();
        },
        child: Text("LogOut"),
          
        ),
      ),
      
    );
  }

  Future<void> logOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    pref.commit();
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MyApp()),
    );
  
  }

  
}