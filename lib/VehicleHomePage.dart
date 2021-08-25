import 'package:flutter/material.dart';
class VehicleHomePage extends StatelessWidget {
 VehicleHomePage();

  @override
  Widget build(BuildContext context) {
    return VehicleHomePageWidget();
  }
}

class VehicleHomePageWidget extends StatefulWidget {
  @override
 VehicleHomePageState createState() => VehicleHomePageState();
}

class VehicleHomePageState extends State {

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text('VehicleHomePage'),),
      body: Center(
        child: Text('hii'),

      ),

    ));
  }



}
