import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Announcement extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AnnouncementWidget();
  }

}

class AnnouncementWidget extends StatefulWidget{
  @override
  AnnouncementState createState()  => AnnouncementState();
}

class AnnouncementState extends State{
  @override
  Widget build(BuildContext context) {
    return(
      Scaffold
        (
        body: Text('Sahana'),
      )
    );
  }
}