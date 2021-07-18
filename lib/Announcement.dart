import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Announcement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnouncementWidget();
  }
}

class AnnouncementWidget extends StatefulWidget {
  @override
  AnnouncementState createState() => AnnouncementState();
}

class AnnouncementState extends State {
  final _formKey = GlobalKey<FormState>();
  List whom = ["Select ","Student", "Staff","others"];
  var whomValue = "Select";
  List Aclass = ["Select ","1", "2","3","4","5","6","7","8","9","10","0thers",];
  var AclassValue = "Select";
  late DateTime date = new DateTime.now();
  String getDate() {
    String currentSelected = "Today";
    if (date != DateTime.now()) {
      currentSelected =
          '${date.day}' + "/" + '${date.month}' + "/" + '${date.year}';
    }
    return currentSelected;
  }


  TextEditingController dateController = TextEditingController();
  TextEditingController dateController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: new Text("Announcement"),
        ),
        body:SingleChildScrollView(child: Center(
            child: Column(
                children: [
          ElevatedButton(
            onPressed: () {
              showDialogBox(createAnnoncementForm(true));
            },
            child: Text(
              "Create",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                )),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Announcement',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),

                Divider(
                  color: Colors.black54,
                ),
                Scrollbar(
                  child:
                Container(
                  height: 350,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,

                      )),
                  child:ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: Container(
                          height:80,
                            width:350,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,

                                )),
                          child: Container(
                            child: Text('item $index')
                          )
                        ),
                      );
                    },
                  ),

                ),
                ),



              ],
            ),
          )
        ])))));
  }

  void showDialogBox(Widget form) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        //transitionDuration: const Duration(milliseconds: 200),

        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
              child: Container(
            width: MediaQuery.of(context).size.width - 10,
            height: MediaQuery.of(context).size.height - 90,
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: form,
          ));
        });
  }

  Widget createAnnoncementForm(bool createReq) {
    return (Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40.0, bottom: 10.0,left: 60,right: 60),
                    child: TextFormField(

                      decoration: new InputDecoration(
                        isDense: true,
                        contentPadding:
                        new EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.0),
                        ),
                        hintText: 'Title',
                        labelText: 'Title',
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter Title';
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0,left: 50,right: 50),
                    child: TextFormField(

                      decoration: new InputDecoration(
                        isDense: true,
                        contentPadding:
                        new EdgeInsets.symmetric(vertical: 60.0, horizontal: 0.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.0),
                        ),
                        hintText: 'Discription',
                        labelText: 'Discription',
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter Description';
                        }
                      },
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0,left: 60,right: 60),
                      child: DropdownButtonFormField(
                        decoration: new InputDecoration(
                          isDense: true,
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 1.0),
                          ),
                          labelText: "Class",
                        ),
                        items: Aclass.map<DropdownMenuItem<String>>((e) {
                          return (DropdownMenuItem(
                            child: Text(e.toString()),
                            value: e,
                          ));
                        }).toList(),
                        value: Aclass[0],
                        onChanged: (value) {
                          setState(() {
                            AclassValue = value.toString();
                            print(AclassValue);
                          });
                        },
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0,left: 60,right:60),
                    child: TextFormField(

                      decoration: new InputDecoration(
                        isDense: true,
                        contentPadding:
                        new EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.0),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(0.0),
                          child: IconButton(
                            icon: const Icon(Icons.calendar_today),
                            onPressed: () {
                              pickDate(context,true);
                            },
                          ), // icon is 48px widget.
                        ),

                        hintText: 'Start Date',
                        labelText: 'Start Date',
                      ),
                      controller: dateController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter Start Date';
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0,left: 60,right:60),
                    child: TextFormField(

                      decoration: new InputDecoration(
                        isDense: true,
                        contentPadding:
                        new EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.0),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(0.0),
                          child: IconButton(
                            icon: const Icon(Icons.calendar_today),
                            onPressed: () {
                              pickDate(context, false);
                            },
                          ), // icon is 48px widget.
                        ),
                        hintText: 'End Date',
                        labelText: 'End Date',
                      ),
                      controller: dateController2,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter End Date';
                        }
                      },
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0,left: 60,right: 60),
                      child: DropdownButtonFormField(
                        decoration: new InputDecoration(
                          isDense: true,
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 1.0),
                          ),
                          labelText: "Whom",
                        ),
                        items: whom.map<DropdownMenuItem<String>>((e) {
                          return (DropdownMenuItem(
                            child: Text(e.toString()),
                            value: e,
                          ));
                        }).toList(),
                        value: whom[0],
                        onChanged: (value) {
                          setState(() {
                            whomValue = value.toString();
                            print(whomValue);
                          });
                        },
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0,left: 60,right: 60),
                    child: TextFormField(

                      decoration: new InputDecoration(
                        isDense: true,
                        contentPadding:
                        new EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.0),
                        ),

                        prefixIcon: Padding(
                          padding: EdgeInsets.all(0.0),
                          child: IconButton(
                            icon: const Icon(Icons.attach_file),
                            onPressed: () {

                            },
                          ), // icon is 48px widget.
                        ),
                        hintText: 'Attachment',
                        labelText: 'Attachment',
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter Description';
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Back'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Submit'),
                      ),
                    ],
                  ),


            ])),
      ),
    )));
  }
  void pickDate(BuildContext context, bool startDate) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(initialDate.year),
      lastDate: DateTime(initialDate.year + 5),
    );
    if (newDate == null) return;
    setState(() {
      date = newDate;
      if(startDate)
        dateController.value = TextEditingValue(text: getDate());
      else
        dateController2.value = TextEditingValue(text: getDate());

    });
  }


}
