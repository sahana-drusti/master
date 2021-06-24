import 'package:drusti/PasswordReset.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class LoginAndRegisteration extends StatelessWidget {
  LoginAndRegisteration() {}
  @override
  Widget build(BuildContext context) {
    return LoginAndRegisterationPage();
  }
}

class LoginAndRegisterationPage extends StatefulWidget {
  @override
  LoginAndRegisterationPageState createState() =>
      LoginAndRegisterationPageState();
}

class LoginAndRegisterationPageState extends State {
  bool login = true;
  bool signup = false;
  List<bool> isSelect = [true, false];
  final _formKey = GlobalKey<FormState>();
  List state = ["karnataka", "goa", "mp"];
  var stateValue = "karnataka";
  List district = ["hassan", "banglore"];
  var districtValue = "hassan";
  List taluk = ["alur", "belur"];
  var talukValue = "alur";
  bool validEmail = true;
  @override
  Widget build(BuildContext context) {
    if (login) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Login Page'),
          ),
          body: SingleChildScrollView(
              child: Column(
            children: [
              ToggleButtons(
                constraints: BoxConstraints.expand(
                  width: 200.0,
                  height: 50.0,
                ),
                isSelected: isSelect,
                children: [
                  Text('SignIn'),
                  Text('SignUp'),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < isSelect.length; i++) {
                      if (i == index) {
                        isSelect[i] = true;
                        if (i == 0) {
                          login = true;
                          signup = false;
                        }
                        if (i == 1) {
                          signup = true;
                          login = false;
                        }
                      } else {
                        isSelect[i] = false;
                      }
                    }
                  });
                },
              ),
              Container(
                  margin: EdgeInsetsDirectional.only(
                      start: 10.0, top: 150.0, end: 10.0),
                  alignment: Alignment.center,
                  child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(bottom: 6.0),
                              child: TextFormField(
                                decoration: new InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  hintText: 'UserName',
                                  labelText: "UserName",
                                ),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Please enter UserName';
                                  }
                                },
                              )),
                          PasswordField(
                            hasFloatingPlaceholder: true,
                            pattern: r'.*[@$#.*].*',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(1),
                                borderSide: BorderSide(
                                  width: 1,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  width: 1,
                                )),
                            errorMessage:
                                'must contain special character either . * @ # \$',
                          ),
                          TextButton(
                            child: Text('Forgot password'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PasswordReset()),
                              );
                            },
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Processing Data')));
                              }
                            },
                            child: Text('Submit'),
                          ),
                        ],
                      ))),
            ],
          )));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ToggleButtons(
                constraints: BoxConstraints.expand(
                  width: 200.0,
                  height: 50.0,
                ),
                isSelected: isSelect,
                children: [
                  Text('SignIn'),
                  Text('SignUp'),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < isSelect.length; i++) {
                      if (i == index) {
                        isSelect[i] = true;
                        if (i == 0) {
                          login = true;
                          signup = false;
                        }
                        if (i == 1) {
                          signup = true;
                          login = false;
                        }
                      } else {
                        isSelect[i] = false;
                      }
                    }
                  });
                },
              ),
              Container(
                  margin: EdgeInsetsDirectional.only(
                      top: 6.0, start: 10.0, end: 10.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
                              child: TextFormField(
                                decoration: new InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  hintText: 'Enter Name',
                                  labelText: "Name",
                                ),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Please enter UserName';
                                  }
                                },
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
                              child: TextFormField(
                                decoration: new InputDecoration(
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
                                    return 'Please enter registration number';
                                  }
                                },
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 6.0, bottom: 0.0),
                              child: TextFormField(
                                decoration: new InputDecoration(
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
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child:
                                  Text((!validEmail) ? "Email Invalid." : "")),
                          Padding(
                            padding: EdgeInsets.only( bottom: 6.0),
                            child: TextFormField(
                              decoration: new InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                hintText: 'Addressline',
                                labelText: 'Address',
                              ),
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Please enter Address';
                                }
                              },
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top:6.0,bottom: 6.0),
                              child: DropdownButtonFormField(
                                decoration: new InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.0),
                                    ),
                                    //hintText:'E-Mail Address',
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
                              padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
                              child: DropdownButtonFormField(
                                decoration: new InputDecoration(
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  labelText: "District",
                                ),
                                items:
                                    district.map<DropdownMenuItem<String>>((e) {
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
                              padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
                              child: DropdownButtonFormField(
                                decoration: new InputDecoration(
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
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
                              padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
                              child: TextFormField(
                                decoration: new InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
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
                          Padding(
                            padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
                            child: PasswordField(
                              hasFloatingPlaceholder: true,
                              pattern: r'.*[@$#.*].*',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(1),
                                  borderSide: BorderSide(
                                    width: 1,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 1,
                                  )),
                              errorMessage:
                                  'must contain special character either . * @ # \$',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
                            child: PasswordField(
                              hasFloatingPlaceholder: true,
                              hintText: ('Confirm Password'),
                              pattern: r'.*[@$#.*].*',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(1),
                                  borderSide: BorderSide(
                                    width: 1,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 1,
                                  )),
                              errorMessage:
                                  'must contain special character either . * @ # \$',
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Processing Data')));
                              }
                            },
                            child: Text('Submit'),
                          ),
                        ],
                      )))
            ],
          ),
        ),
      );
    }
  }
}
