import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:email_validator/email_validator.dart';
import 'package:table_calendar/table_calendar.dart';

class CreateStaff extends StatefulWidget {
  @override
  CreateStaffState createState() => CreateStaffState();
}

class CreateStaffState extends State<CreateStaff> {
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  int val = 1;
  bool validPhoneNo = true;
  bool validEmail = true;
  bool validParentForm = false;
  bool validBasicForm = false;
  bool validContactForm = false;
  bool validAddressForm = false;
  bool validRegNo = true;
  bool address_Value = false;
  String radioItem = '';
  bool _value = false;
  List country = ["India"];
  var countryValue = "India";
  List state = [
    "select",
    "Andhra Pradesh",
    "Arunachal Pradesh ",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Lakshadweep",
    "National Capital Territory of Delhi",
    "Puducherry"
  ];
  var stateValue = "select";
  List district = ["select", "hassan", "banglore"];
  var districtValue = "select";
  List taluk = ["alur", "belur", "select"];
  var talukValue = "select";
  String addressLine1 = "";
  String addressLine2 = "";
  List addressResult = [];
  String addressId = "";
  String zipCode = "test";
  var pDistrictValue = "select";
  var pStateValue = "select";
  var pTalukValue = "select";
  var pCountryValue = "select";

  List caste = ["2A", "3B"];
  var casteValue = "";
  List religion = ["Hindhu", "Muslim"];
  var religionValue = "";

  final textController = TextEditingController();
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
  TextEditingController addressLine1Controller = TextEditingController();
  TextEditingController addressLine2Controller = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController pAddressLine1Controller = TextEditingController();
  TextEditingController pAddressLine2Controller = TextEditingController();
  TextEditingController pZipCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text("Create Staff"),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.upload,
                  color: Colors.white,
                ),
                onPressed: () {
                  Dialog errorDialog = Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(12.0)), //this right here
                    child: Container(
                      height: 300.0,
                      width: 600.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'Choose files to Upload',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.0, bottom: 10.0, left: 60, right: 60),
                            child: TextFormField(
                              controller: addressLine2Controller,
                              decoration: new InputDecoration(
                                isDense: true,
                                contentPadding: new EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(32.0)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                hintText: 'Choose file to Upload',
                                labelText: 'Choose file to Upload',
                              ),
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Please select a file';
                                }
                              },
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Browse!',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'UPLOAD!',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ))
                        ],
                      ),
                    ),
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => errorDialog);
                })
          ],
        ),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 150),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      )),
                  child: ExpansionTile(
                    title: Text(
                      "Basic",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(
                      Icons.person,
                      size: 36.0,
                    ),
                    children: <Widget>[
                      Container(
                        child: validBasicForm
                            ? Text('Some fields are Missing')
                            : Text(''),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              bottom: 6.0, left: 60, right: 60, top: 10),
                          child: TextFormField(
                            onChanged: (value) {
                              RegExp exp = RegExp(r'^[a-zA-Z0-9]+$');
                              if (!exp.hasMatch(value)) {
                                setState(() {
                                  validRegNo = false;
                                });
                              } else {
                                setState(() {
                                  validRegNo = true;
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
                                hintText: 'Registration Number',
                                labelText: "Reg.No."),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Please enter Registration number';
                              } else if (!validRegNo) {
                                return 'Please enter valid Reg. No.';
                              }
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              bottom: 6.0, left: 60, right: 60, top: 10),
                          child: TextFormField(
                            autofocus: false,
                            decoration: new InputDecoration(
                              isDense: true,
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                              ),
                              hintText: 'First Name',
                              labelText: "First name",
                            ),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Please enter First Name';
                              }
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              bottom: 6.0, left: 60, right: 60, top: 10),
                          child: TextFormField(
                            autofocus: false,
                            decoration: new InputDecoration(
                              isDense: true,
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                              ),
                              hintText: 'Middle Name',
                              labelText: "Middle Name",
                            ),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Please enter Middle Name';
                              }
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              bottom: 6.0, left: 60, right: 60, top: 10),
                          child: TextFormField(
                            autofocus: false,
                            decoration: new InputDecoration(
                              isDense: true,
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                              ),
                              hintText: 'Last Name',
                              labelText: "Last Name",
                            ),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Please enter Last Name';
                              }
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              bottom: 6.0, left: 60, right: 60, top: 10),
                          child: TextFormField(
                            autofocus: false,
                            decoration: new InputDecoration(
                              isDense: true,
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                              ),
                              hintText: 'Class',
                              labelText: "Class",
                            ),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Please enter Class';
                              }
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              bottom: 6.0, left: 60, right: 60, top: 10),
                          child: TextFormField(
                            autofocus: false,
                            decoration: new InputDecoration(
                              isDense: true,
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(0.0),
                                child: IconButton(
                                  icon: const Icon(Icons.calendar_today),
                                  onPressed: () {
                                    pickDate(context);
                                  },
                                ), // icon is 48px widget.
                              ),
                              hintText: 'DOB',
                              labelText: "DOB",
                            ),
                            controller: dateController,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Please enter Date Of Birth';
                              }
                            },
                          )),
                      ListTile(
                        title: Text("Male"),
                        leading: Radio(
                          value: 1,
                          groupValue: val,
                          onChanged: (value) {
                            setState(() {
                              val = 1;
                            });
                          },
                          activeColor: Colors.black,
                        ),
                      ),
                      ListTile(
                        title: Text("Female"),
                        leading: Radio(
                          value: 2,
                          groupValue: val,
                          onChanged: (value) {
                            setState(() {
                              val = 2;
                            });
                          },
                          activeColor: Colors.black,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if ((_formKey.currentState!.validate() || true)) {
                            setState(() {
                              validBasicForm = true;
                            });
                          }
                        },
                        child: Text('Save'),
                      ),
                    ],
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      )),
                  child: ExpansionTile(
                      title: Text(
                        'Contact',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: Icon(
                        Icons.phone,
                        size: 36.0,
                      ),
                      children: <Widget>[
                        Container(
                          child: validContactForm
                              ? Text('Some fields are Missing')
                              : Text(''),
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
                                  hintText: 'Phone Number-2',
                                  labelText: "Phone Number-2"),
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                bottom: 6.0, left: 60, right: 60, top: 10),
                            child: TextFormField(
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
                                  hintText: 'E-Mail Address',
                                  labelText: "E-mail."),
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Please enter Email';
                                }
                              },
                              onChanged: (value) => {
                                setState(() {
                                  if (EmailValidator.validate(value)) {
                                    validEmail = true;
                                  } else {
                                    validEmail = false;
                                  }
                                }),
                              },
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                bottom: 6.0, left: 60, right: 60, top: 10),
                            child: TextFormField(
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
                                  hintText: 'E-Mail Address 2',
                                  labelText: "E-mail 2."),
                            )),
                        ElevatedButton(
                          onPressed: () {
                            if ((_formKey.currentState!.validate() || true)) {
                              setState(() {
                                validContactForm = true;
                              });
                            }
                          },
                          child: Text('Save'),
                        ),
                      ]),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      )),
                  child: ExpansionTile(
                      title: Text(
                        'Address',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: Icon(
                        Icons.home,
                        size: 36.0,
                      ),
                      children: <Widget>[
                        Container(
                          child: validAddressForm
                              ? Text('Some fields are Missing')
                              : Text(''),
                        ),
                        ListTile(
                          title: Text("Current"),
                          leading: Radio(
                            value: 1,
                            groupValue: val,
                            onChanged: (value) {
                              setState(() {
                                val = 1;
                              });
                            },
                            activeColor: Colors.black,
                          ),
                        ),
                        ListTile(
                          title: Text("Permanent Address"),
                          leading: Radio(
                            value: 2,
                            groupValue: val,
                            onChanged: (value) {
                              setState(() {
                                val = 2;
                              });
                            },
                            activeColor: Colors.black,
                          ),
                        ),
                        CheckboxListTile(
                          title: Text("Both addresses are Same"),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: address_Value,
                          activeColor: Colors.black,
                          checkColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              if (null != value && value) {
                                address_Value = true;
                                populatePermanentAddress();
                              } else
                                (address_Value = false);
                            });
                          },
                        ),
                        Container(
                          child: val == 1
                              ? createAddressForm(true)
                              : createAddressForm(false),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if ((_formKey1.currentState!.validate() || true)) {
                              setState(() {
                                validAddressForm = true;
                              });
                            }
                          },
                          child: Text('Save'),
                        ),
                      ]),
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
              ]),
            )));
  }

  Widget createAddressForm(bool createReq) {
    return (Center(
        child: Form(
          key: _formKey1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 6.0, left: 60, right: 60, top: 10),
                child: TextFormField(
                  controller:
                  createReq ? addressLine1Controller : pAddressLine1Controller,
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
                      return 'Please enter Addressline 1';
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 6.0, left: 60, right: 60, top: 10),
                child: TextFormField(
                  controller:
                  createReq ? addressLine2Controller : pAddressLine2Controller,
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
                ),
              ),
              Padding(
                  padding:
                  EdgeInsets.only(bottom: 6.0, left: 60, right: 60, top: 10),
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
                        if (createReq)
                          countryValue = value.toString();
                        else
                          pCountryValue = value.toString();
                      });
                    },
                  )),
              Padding(
                  padding:
                  EdgeInsets.only(bottom: 6.0, left: 60, right: 60, top: 10),
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
                    value: createReq ? stateValue : pStateValue,
                    validator: (value) {
                      if (value == null || value == 'select') {
                        return 'Please select State';
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        if (createReq)
                          stateValue = value.toString();
                        else
                          pStateValue = value.toString();
                      });
                    },
                  )),
              Padding(
                  padding:
                  EdgeInsets.only(bottom: 6.0, left: 60, right: 60, top: 10),
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
                    value: createReq ? districtValue : pDistrictValue,
                    validator: (value) {
                      if (value == null || value == 'select') {
                        return 'Please select District ';
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        if (createReq)
                          districtValue = value.toString();
                        else
                          pDistrictValue = value.toString();
                      });
                    },
                  )),
              Padding(
                  padding:
                  EdgeInsets.only(bottom: 6.0, left: 60, right: 60, top: 10),
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
                    value: createReq ? talukValue : pTalukValue,
                    validator: (value) {
                      if (value == null || value == 'select') {
                        return 'Please select Taluk ';
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        if (createReq)
                          talukValue = value.toString();
                        else
                          pTalukValue = value.toString();
                      });
                    },
                  )),
              Padding(
                  padding:
                  EdgeInsets.only(bottom: 6.0, left: 60, right: 60, top: 10),
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
                    controller: createReq ? zipCodeController : pZipCodeController,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter pincode';
                      }
                    },
                  )),
            ],
          ),
        )));
  }

  populatePermanentAddress() {
    pAddressLine1Controller.value =
        TextEditingValue(text: addressLine1Controller.text);
    pAddressLine2Controller.value =
        TextEditingValue(text: addressLine2Controller.text);
    pZipCodeController.value = TextEditingValue(text: zipCodeController.text);
    pCountryValue = countryValue;
    pStateValue = stateValue;
    pDistrictValue = districtValue;
    pTalukValue = talukValue;
  }

  void pickDate(BuildContext context) async {
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
      dateController.value = TextEditingValue(text: getDate());
    });
  }
}
