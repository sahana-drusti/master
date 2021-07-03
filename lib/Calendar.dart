import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calendar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CalendarWidget();
  }

}

class CalendarWidget extends StatefulWidget{
  @override
  CalendarState createState()  => CalendarState();
}

class CalendarState extends State{
  @override
  Widget build(BuildContext context) {
    return(
        Scaffold
          (
          body: Text('Calendar'),
        )
    );
  }
}