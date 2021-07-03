import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return NotificationsWidget();
  }

}

class NotificationsWidget extends StatefulWidget{
  @override
  NotificationsState createState()  => NotificationsState();
}

class NotificationsState extends State{
  @override
  Widget build(BuildContext context) {
    return(
        Scaffold
          (
          body: Text('Notifications'),
        )
    );
  }
}