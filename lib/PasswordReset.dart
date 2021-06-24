import 'package:drusti/PasswordReset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

class PasswordReset extends StatelessWidget {
  PasswordReset();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("reset password"),
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
            child: PasswordField(
              hasFloatingPlaceholder: true,
              hintText: ('Confirm Password'),
              pattern: r'.*[@$#.*].*',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: BorderSide(
                    width: 2,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 2,
                  )),
              errorMessage: 'must contain special character either . * @ # \$',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 6.0),
            child: PasswordField(
              hasFloatingPlaceholder: true,
              hintText: ('Confirm Password'),
              pattern: r'.*[@$#.*].*',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: BorderSide(
                    width: 2,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 2,
                  )),
              errorMessage: 'must contain special character either . * @ # \$',
            ),
          ),
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
