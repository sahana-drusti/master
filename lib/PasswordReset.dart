import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordReset extends StatelessWidget {
  PasswordReset();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 4.0, bottom: 6.0),
            child: TextFormField(
              decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  hintText: 'username'),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Please enter UserName';
                }
              },
            ),
          ),
          Padding(
                              padding: EdgeInsets.only(bottom: 6.0),
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
                              padding: EdgeInsets.only(top: 6.0,bottom: 6.0),
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

          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
