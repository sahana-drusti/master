import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
  bool validPhoneNo = true;
  bool validEmail = true;
  bool validPhoneNo2 = true;
  bool validEmail2 = true;
  final _formKey = GlobalKey<FormState>();
  List country = ["India"];
  var countryValue = "India";
  List state = ["Andhra Pradesh","Arunachal Pradesh ","Assam","Bihar","Chhattisgarh","Goa","Gujarat","Haryana","Himachal Pradesh","Jammu and Kashmir","Jharkhand","Karnataka","Kerala","Madhya Pradesh","Maharashtra","Manipur","Meghalaya","Mizoram","Nagaland","Odisha","Punjab","Rajasthan","Sikkim","Tamil Nadu","Telangana","Tripura","Uttar Pradesh","Uttarakhand","West Bengal","Andaman and Nicobar Islands","Chandigarh","Dadra and Nagar Haveli","Daman and Diu","Lakshadweep","National Capital Territory of Delhi","Puducherry"];
  var stateValue = "";
  List district = ["hassan", "banglore"];
  var districtValue = "";
  List taluk = ["alur", "belur"];
  var talukValue = "";
  String addressLine1 = "";
  String addressLine2 = "";
  List addressResult = [];
  String addressId = "";
  String zipCode = "test";
  String userId = "";
  TextEditingController addressLine1Controller = TextEditingController();
  TextEditingController addressLine2Controller = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


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
          createContainer(addressContainer(), 200.0),
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
              child:  addIcon(),
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

  checkAddress() async {
    bool isAvail = false;
    await getAddress().then((value) => {
      if(value){
        isAvail = true
      }
    });
    return isAvail;
      }

  editIcon() {
    return (IconButton(onPressed: () {showDialogBox(createAddressForm(false));}, icon: Icon(Icons.edit)));

  }

  addIcon() {
    return (IconButton(
        onPressed: () {
          showDialogBox(createAddressForm(true));
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
              onPressed: () {
                showDialogBox(createContactForm(true));
              },
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

  Widget createAddressForm(bool createReq) {
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
              controller: addressLine1Controller,
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
              controller: addressLine2Controller,
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
                value: state[0],
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
                value: district[0],
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
                value: taluk[0],
                onChanged: (value) {
                  setState(() {
                    talukValue = value.toString();
                    print(talukValue);
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
                controller: zipCodeController,
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
                  returnBack();
                },
                child: Text(
                  "Back",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate())
                    {
                      print(createReq);
                      if(createReq){
                        setState(() {
                          final response = createAddress().then((value) => returnBack());
                        });

                      }else{
                        setState(() {
                          final response = updateAddress().then((value) => returnBack());
                        });

                      }
                    }
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
                                controller: passwordController,
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
                                  returnBack(); // Validate returns true if the form is valid, or false otherwise.
                                },
                                child: Text('Back'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()){
                                    setState(() {
                                      final response = updateUserPassword().then((value) => returnBack());
                                    });
                                        }
                                     // Validate returns true if the form is valid, or false otherwise.
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
  Widget createContactForm(bool createReq) {
    return (Scaffold(
        body: SingleChildScrollView(
            child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                      ),


                      Padding(
                          padding: EdgeInsets.only(
                              bottom: 6.0, left: 60, right: 60, top: 10),
                          child: TextFormField(
                            onChanged: (value) {
                              RegExp exp =
                              RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
                              if (!exp.hasMatch(value)) {
                                setState(() {
                                  validPhoneNo = false;
                                });
                              } else {
                                setState(() {
                                  validPhoneNo = true;
                                });
                              }
                            },
                            decoration: new InputDecoration(
                                isDense: true,
                                contentPadding: new EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                hintText: 'Phone Number ',
                                labelText: "Phone Number"),

                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Please enter Phone number';
                              } else if (!validPhoneNo) {
                                return 'Please enter valid Phone number';
                              }
                            },
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 6.0, left: 60, right: 60, top: 10),
                        child: TextFormField(
                          onChanged: (value) {
                            RegExp exp =
                            RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
                            if (!exp.hasMatch(value)) {
                              setState(() {
                                validPhoneNo2 = false;
                              });
                            } else {
                              setState(() {
                                validPhoneNo2 = true;
                              });
                            }
                          },
                          decoration: new InputDecoration(
                              isDense: true,
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.0),
                              ),
                              hintText: 'Phone Number-2',
                              labelText: "Phone Number-2"),

                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 6.0, left: 60, right: 60, top: 10),
                        child: TextFormField(
                          onChanged: (value) {
                            RegExp exp =
                            RegExp(  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                            if (!exp.hasMatch(value)) {
                              setState(() {
                                validEmail = false;
                              });
                            } else {
                              setState(() {
                                validEmail = true;
                              });
                            }
                          },
                          decoration: new InputDecoration(
                              isDense: true,
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.0),
                              ),
                              hintText: 'Email ',
                              labelText: "Email"),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please enter Email';
                            } else if (!validEmail) {
                              return 'Please enter valid E-Mail id';
                            }
                          },
                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 6.0, left: 60, right: 60, top: 10),
                        child: TextFormField(
                          onChanged: (value) {
                            RegExp exp =
                            RegExp(  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                            if (!exp.hasMatch(value)) {
                              setState(() {
                                validEmail2 = false;
                              });
                            } else {
                              setState(() {
                                validEmail2 = true;
                              });
                            }
                          },
                          decoration: new InputDecoration(
                              isDense: true,
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.0),
                              ),
                              hintText: 'Email-2 ',
                              labelText: "Email-2"),

                        ),

                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              returnBack();
                            },
                            child: Text(
                              "Back",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()){
                              setState(() {

                              });
                              }

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


  Future<bool> getAddress() async {
    bool addressPresent = false;
    await SharedPreferences.getInstance().then((value) => userId = value.getString("token")!);
    String url = "http://192.168.1.8:3000/address?userId="+userId;
    var response = await http.get(Uri.parse(url));
    var result = json.decode(response.body);
    if(result.toString().length > 2){
      addressPresent = true;
      addressResult = json.decode(response.body);
    }
    return addressPresent;

  }

  addressContainer() {
    return (FutureBuilder(
      future: getAddress(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        List<Widget> children;
        if(snapshot.hasData && snapshot.data){
          addData();
          children = <Widget>[
            editAddress()

          ];
        }else{
          children = <Widget>[
             addAddress()
          ];

        }
        return Column(
          children: children

        );
    },

    ));
  }

  editAddress() {

    return (Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Text('Address',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            /**/
            Container(
              margin: EdgeInsets.only(left: 150.0),
              child:  editIcon(),
            ),
            Container(
              margin: EdgeInsets.only(right:10.0),
              child:  deleteIcon(),
            ),
          ],
        ),
        Divider(
          color: Colors.black,
        ),
        Container(
          child: Text(addressLine1),
        ),
        Container(
          child: Text(addressLine2),
        ),
        Container(
          child: Text(talukValue),
        ),
        Container(
          child: Text(districtValue),
        ),
        Container(
          child: Text(zipCode),
        ),
        Container(
          child: Text(stateValue),
        ),
        Container(
          child: Text(countryValue),
        ),

      ],
    ));
  }

  void addData() {
    if(addressResult.isNotEmpty){
      addressLine1 = addressResult.elementAt(0)['addressLine1'];
      addressLine2 = addressResult.elementAt(0)['addressLine2'];
      talukValue = addressResult.elementAt(0)['taluk'];
      stateValue = addressResult.elementAt(0)['state'];
      districtValue = addressResult.elementAt(0)['district'];
      countryValue = addressResult.elementAt(0)['country'];
      zipCode = addressResult.elementAt(0)['zipCode'];
      addressId = addressResult.elementAt(0)['_id'];
      if(addressLine1 != null && addressLine1.isNotEmpty)
        addressLine1Controller.value = TextEditingValue(text: addressLine1);
      if(addressLine2 != null && addressLine2.isNotEmpty)
        addressLine2Controller.value= TextEditingValue(text: addressLine2);
      if(zipCode != null && zipCode.isNotEmpty)
        zipCodeController.value = TextEditingValue(text: zipCode);
    }

  }

  Future<http.Response> updateAddress() async {
      String url = "http://192.168.1.8:3000/address";
      print(talukValue);
      var response = await http.put(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String,String>{
          "addressId": addressId,
          "addressLine1": addressLine1,
          "addressLine2": addressLine2,
          "state": stateValue,
          "taluk": talukValue,
          "zipCode": zipCodeController.text.toString(),
          "district": districtValue,
          "country": countryValue,
          "userId":userId
        })
      );
      print(response.body)
     ; if(response.statusCode !=200){
        throw Exception("Error Updating Address");
      }
      return response;
  }

  returnBack(){
    Navigator.of(context, rootNavigator: true)
        .pop();
  }

  deleteIcon() {
    return (
        IconButton(
            onPressed: () {
              setState(() {
                deleteAddress();
                countryValue ="";
              });

              },
            icon: Icon(Icons.delete)
        )
    );
  }

  Future<void> deleteAddress() async {
    String url = "http://192.168.1.8:3000/address?addressId="+addressId;
    final response = await http.delete(Uri.parse(url));
    if(response.statusCode != 200 ){
      throw Exception('Error while deleting Address');
    }

  }

  Future<http.Response> createAddress() async {
    String url = "http://192.168.1.8:3000/address";
    final response = await http.post(Uri.parse(url),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
        body: jsonEncode(<String,String>{
          //"addressId": addressId,
          "addressLine1": addressLine1,
          "addressLine2": addressLine2,
          "state": stateValue,
          "taluk": talukValue,
          "zipCode": zipCodeController.text.toString(),
          "district": districtValue,
          "country": countryValue,
          "userId":userId
        })
    );
    print(response.body);
    if(response.statusCode !=200){
      throw Exception("Error Creating Address");
    }
    return response;
  }

  Future<void> updateUserPassword() async {
    String url = "http://192.168.1.8:3000/users?userId="+userId;
    final response = await http.put(Uri.parse(url),headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String,String>{
    "password": passwordController.text.toString(),
    })
    );
  }
}
