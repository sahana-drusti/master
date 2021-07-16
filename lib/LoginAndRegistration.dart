import 'dart:convert';
import 'package:drusti/BottomNavigation.dart';
import 'package:drusti/HomePage.dart';
import 'package:drusti/PasswordReset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginAndRegisteration extends StatelessWidget {
  final String type;
  LoginAndRegisteration({required this.type});

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
  final loginFormKey = GlobalKey<FormState>();
  final regFormKey = GlobalKey<FormState>();
  List state = ["karnataka", "goa", "mp"];
  var stateValue = "karnataka";
  List district = ["hassan", "banglore"];
  var districtValue = "hassan";
  List taluk = ["alur", "belur"];
  var talukValue = "alur";
  bool validFormKeyLogin = true;
  bool validEmail = true;
  bool validRegNo = true;
  final rNameController = TextEditingController();
  final rEmailController = TextEditingController();
  final rPasswordController = TextEditingController();
  final rConfirmPasswordController = TextEditingController();
  final rRegNoController = TextEditingController();
  final lEmailController = TextEditingController();
  final lPasswordController = TextEditingController();
  bool userCreateSuccess = true;
  bool usergetSuccess = true;

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
                child: this.usergetSuccess?Text(''):Text('Error Fetching User',style: TextStyle(color: Colors.red),),
              ),
              Container(
                  margin: EdgeInsetsDirectional.only(
                      start: 10.0, top: 150.0, end: 10.0),
                  alignment: Alignment.center,
                  child: Form(
                      key: loginFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(bottom: 6.0),
                              child: TextFormField(
                                controller: lEmailController,
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
                                autofocus: false,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Please enter UserName';
                                  }
                                },
                              )),
                          Padding(
                              padding: EdgeInsets.only(bottom: 6.0),
                              child: TextFormField(
                                controller: lPasswordController,
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
                              if (loginFormKey.currentState!.validate()) {
                               getUserAndValidate().then((value) =>
                               {
                               if(value){
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                     builder: (context) => BottomNavigation()),
                               )
                               }});

                                }else{


                              }
                            },
                            child: Text('SignIn'),
                          ),
                        ],
                      ))),
            ],
          )));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Registration Page'),
        ),
        resizeToAvoidBottomInset: true,
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
                child: this.userCreateSuccess?Text(''):Text('Error Creating User',style: TextStyle(color: Colors.red),),
              ),
              Container(
                  margin: EdgeInsetsDirectional.only(
                      top: 50.0, start: 10.0, end: 10.0),
                  child: Form(
                      key: regFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
                              child: TextFormField(
                                controller: rNameController,
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
                                onChanged: (value) {
                                  RegExp exp = RegExp(r'^[a-zA-Z0-9&%=]+$');
                                  if (!exp.hasMatch(value)) {
                                    setState(() {
                                      validRegNo = false;
                                    });
                                  }else{
                                    setState(() {
                                      validRegNo = true;
                                    });
                                  }
                                },
                                controller: rRegNoController,
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
                                  } else if (!validRegNo) {
                                    return 'Please enter valid Reg. No.';
                                  }
                                },
                              )),
                          Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child:
                              Text((!validRegNo) ? "RegNo Invalid." : "")),
                          Padding(
                              padding: EdgeInsets.only(top: 6.0, bottom: 0.0),
                              child: TextFormField(
                                controller: rEmailController,
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
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child:
                                  Text(
                                      (!validEmail) ? "Email Invalid." : "")),


                          Padding(
                              padding: EdgeInsets.only(bottom: 6.0),
                              child: TextFormField(
                                controller: rPasswordController,
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
                                controller: rConfirmPasswordController,
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
                                  } else if (rConfirmPasswordController.text
                                          .toString() !=
                                      rPasswordController.text.toString()) {
                                    return 'Password didnot match';
                                  }
                                },
                              )),
                          ElevatedButton(
                            onPressed: () {
                              if (regFormKey.currentState!.validate()) {
                                final response = createUser();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BottomNavigation()),
                                );
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

  Future<http.Response> createUser() async {
    final response = await http.post(
      Uri.parse("http://192.168.1.8:3000/users"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': rNameController.text,
        'email': rEmailController.text,
        'reg_no': rRegNoController.text,
        'password': rPasswordController.text,
      }),
    );
    print(response);
    if (response.statusCode != 200) {
      this.userCreateSuccess = false;
      throw Exception('error while creating user');
    }else{
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString("token", rEmailController.text.toString());
    }

    return response;
  }

  Future<bool> getUserAndValidate() async {
    bool isValidUser = false;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    if(lEmailController.text.isNotEmpty) {
      String url = "http://localhost:3000/users?email=" +
          lEmailController.text.toString();
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        var result = json.decode(response.body);
        String userId = result['_id'];
        if(lEmailController.text.toString().isNotEmpty || lPasswordController.text.toString().isNotEmpty || result['email'] == lEmailController.text.toString() || result['password'] == lPasswordController.text.toString()){
          localStorage.setString("token", userId);
          isValidUser = true;
        }
      }else{
        this.usergetSuccess = false;
        throw new Exception('Error fetching userId');
      }
    }
    return isValidUser;
  }
}
