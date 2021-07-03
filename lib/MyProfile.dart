import 'package:drusti/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MyProfileStateWidget());
  }
}

class MyProfileStateWidget extends StatefulWidget {
  @override
  MyProfileState createState() => MyProfileState();
}

class MyProfileState extends State {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
       // backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(child: Text('Profile')),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        body:
        SingleChildScrollView(
          child:

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            createContainer(profileDetails(), 150.0),
            createContainer(addAddress(),200.0),
            createContainer(updatePassword(),80.0),
            createContainer(updateContact(),80.0),
          ],
        )),
    )
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

  profileDetails() {
    return Container(
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_circle_rounded,
                size: 64.0,
              )),
          Container(
            margin: EdgeInsets.only(left: 40.0, top: 25.0),
            child: Column(children: [
              Text(
                'My School Name',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),

              Container(
                margin: EdgeInsets.only(right: 140.0),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.location_on_outlined,
                  ),
                  tooltip: 'city,state',
                  alignment: Alignment.bottomLeft,
                ),

              ),
              Text('City,State'),

            ]),
          ),
        ],
      ),
    );
  }

  addAddress() {
    return (
    Column(
      children:[
        Row(
          children:[
            Container(
              margin:EdgeInsets.only(left:20.0),
              child: Text('Address', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
            ),
            Container(
              margin: EdgeInsets.only(left: 200.0),
              child:checkAddress()?editIcon():addIcon(),
            )
          ],
        ),

        Divider(
          color: Colors.black,
        ),

      ],

    )
    );
  }


  updatePassword() {
    return(
    Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.0),
          child: Text('Password', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        Container(
          margin: EdgeInsets.only(left: 200.0),
          child: IconButton(onPressed: () {
            showDialogBox();
          },
            icon: Icon(Icons.edit),
          )
        )
      ],
    )
    );
  }

  checkAddress() {
    return false;
  }

  editIcon() {
    return(
        IconButton(onPressed: (){

        }, icon: Icon(Icons.edit))
    );
  }

  addIcon() {
    return(
      IconButton(onPressed: (){
        showDialogBox();
      }, icon: Icon(Icons.add_box_outlined))
    );
  }

  updateContact() {
    return(
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Text('Contact', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),
            Container(
                margin: EdgeInsets.only(left: 200.0),
                child: IconButton(onPressed: () {
                  showDialogBox();
                },
                  icon: Icon(Icons.edit),
                )
            )
          ],
        )
    );
  }

  void showDialogBox() {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations.of(context)
            .modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        //transitionDuration: const Duration(milliseconds: 200),

        pageBuilder: (BuildContext buildContext,
            Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 10,
              height: MediaQuery.of(context).size.height -  80,
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    child: Text('Add Address'),
                  ),
                  Divider(
                    color: Colors.black,
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }



}
