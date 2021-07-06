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
  final _formKey = GlobalKey<FormState>();
  List country = ["India"];
  var countryValue = "India";
  List state = ["karnataka", "goa", "mp"];
  var stateValue = "karnataka";
  List district = ["hassan", "banglore"];
  var districtValue = "hassan";
  List taluk = ["alur", "belur"];
  var talukValue = "alur";

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
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          createContainer(profileDetails(), 150.0),
          createContainer(addAddress(), 200.0),
          createContainer(updatePassword(), 80.0),
          createContainer(updateContact(), 80.0),
        ],
      )),
    ));
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
    return (Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Text('Address',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            Container(
              margin: EdgeInsets.only(left: 200.0),
              child: checkAddress() ? editIcon() : addIcon(),
            )
          ],
        ),
        Divider(
          color: Colors.black,
        ),
      ],
    ));
  }

  updatePassword() {
    return (Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.0),
          child: Text('Password',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        Container(
            margin: EdgeInsets.only(left: 200.0),
            child: IconButton(
              onPressed: () {
                showDialogBox(createPasswordResetForm());
              },
              icon: Icon(Icons.edit),
            ))
      ],
    ));
  }

  checkAddress() {
    return false;
  }

  editIcon() {
    return (IconButton(onPressed: () {}, icon: Icon(Icons.edit)));
  }

  addIcon() {
    return (IconButton(
        onPressed: () {
          showDialogBox(createAddressForm());
        },
        icon: Icon(Icons.add_box_outlined)));
  }

  updateContact() {
    return (Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.0),
          child: Text(
            'Contact',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 200.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit),
            ))
      ],
    ));
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

  Widget createAddressForm() {
    return (Scaffold(
        body: SingleChildScrollView(
            child: Center(
                child: Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(
            color: Colors.black,
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
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
                hintText: 'Addressline 1',
                labelText: 'Addressline 1',
              ),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Please enter Address';
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: TextFormField(
              decoration: new InputDecoration(
                isDense: true,
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                hintText: 'Addressline 2',
                labelText: 'Addressline 2',
              ),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Please enter Address';
                }
              },
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: DropdownButtonFormField(
                decoration: new InputDecoration(
                    isDense: true,
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    labelText: "Country"),
                items: country.map<DropdownMenuItem<String>>((e) {
                  return (DropdownMenuItem(
                    child: Text(e.toString()),
                    value: e,
                  ));
                }).toList(),
                value: countryValue,
                onChanged: (value) {
                  setState(() {
                    countryValue = value.toString();
                  });
                },
              )),
          Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: DropdownButtonFormField(
                decoration: new InputDecoration(
                    isDense: true,
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    labelText: "State."),
                items: state.map<DropdownMenuItem<String>>((e) {
                  return (DropdownMenuItem(
                    child: Text(e.toString()),
                    value: e,
                  ));
                }).toList(),
                value: stateValue,
                onChanged: (value) {
                  setState(() {
                    stateValue = value.toString();
                  });
                },
              )),
          Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
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
                  labelText: "District",
                ),
                items: district.map<DropdownMenuItem<String>>((e) {
                  return (DropdownMenuItem(
                    child: Text(e.toString()),
                    value: e,
                  ));
                }).toList(),
                value: districtValue,
                onChanged: (value) {
                  setState(() {
                    districtValue = value.toString();
                  });
                },
              )),
          Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
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
                  labelText: "Taluk",
                ),
                items: taluk.map<DropdownMenuItem<String>>((e) {
                  return (DropdownMenuItem(
                    child: Text(e.toString()),
                    value: e,
                  ));
                }).toList(),
                value: talukValue,
                onChanged: (value) {
                  setState(() {
                    talukValue = value.toString();
                  });
                },
              )),
          Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextFormField(
                decoration: new InputDecoration(
                  isDense: true,
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  hintText: 'PinCode',
                  labelText: 'PinCode',
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter pincode';
                  }
                },
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: Text(
                  "Back",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate())
                    Navigator.of(context, rootNavigator: true).pop();
                },
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ],
      ),
    )))));
  }

  Widget createPasswordResetForm() {
    return (Scaffold(
        body: SingleChildScrollView(
            child: Center(
                child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Padding(
                              padding: EdgeInsets.only(top: 150.0,bottom: 6.0),
                              child: TextFormField(
                                autofocus: false,
                                obscureText: true,
                                decoration: new InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  hintText: 'Password',
                                  labelText: "Password",
                                ),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Please enter Password';
                                  }
                                },
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
                              child: TextFormField(
                                autofocus: false,
                                obscureText: true,
                                decoration: new InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  hintText: 'Confirm Password',
                                  labelText: "Confirm Password",
                                ),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Please enter Password';
                                  }
                                },
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop(); // Validate returns true if the form is valid, or false otherwise.
                                },
                                child: Text('Back'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate())
                                    Navigator.of(context, rootNavigator: true)
                                        .pop(); // Validate returns true if the form is valid, or false otherwise.
                                },
                                child: Text('Submit'),
                              ),
                            ],
                          ),
                        ]
                    )
                )
            )
        )
    )
    );
  }
}
