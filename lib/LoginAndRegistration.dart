import 'package:drusti/PasswordReset.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginAndRegisteration extends StatelessWidget{
  LoginAndRegisteration(){

  }
  @override
  Widget build(BuildContext context) {
    return LoginAndRegisterationPage();

  }

}

class LoginAndRegisterationPage  extends StatefulWidget{
  @override
  LoginAndRegisterationPageState createState() => LoginAndRegisterationPageState();
}

class LoginAndRegisterationPageState extends State{
  int _value = 1;
  bool login = true;
  bool signup = false;
  List<bool> isSelect = [true,false];
  final _formKey = GlobalKey<FormState>();
  List state=["karnataka","goa","mp"];
  var stateValue="karnataka";
  List district=["hassan","banglore"];
  var districtValue="hassan";
  List thalluk=["alur","belur"];
  var thallukValue="alur";
  @override
  Widget build(BuildContext context) {

    if(login){
      return Scaffold(
          appBar: AppBar(
            title: Text('Login Page'),
          ),
          body:Column(
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
                onPressed: (int index){
                  setState(() {
                    for(int i=0;i<isSelect.length;i++){
                      if(i == index){
                        isSelect[i] = true;
                        if(i==0){
                          login = true;
                          signup = false;
                        }
                        if(i==1){
                          signup = true;
                          login = false;
                        }
                      }else{
                        isSelect[i] = false;
                      }
                    }

                  });
                },
              ),
              Form(
                  key:_formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: new InputDecoration(
                       focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.black, width: 2.0),
                       ),
                        enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                          hintText:'username'
                      ),
                        validator: (val){
                          if(val == null || val.isEmpty){
                            return 'Please enter UserName';
                          }
                        },

                      ),
                      PasswordField(
                        hasFloatingPlaceholder: true,
                        pattern: r'.*[@$#.*].*',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: BorderSide(width: 2, )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 2,)),
                        errorMessage: 'must contain special character either . * @ # \$',
                      ),
                      TextButton(
                        child: Text('forgot password'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PasswordReset()),
                          );
                        },

                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text('Processing Data')));
                          }
                        },
                        child:
                        Text('Submit'),


                      ),

                    ],
                  ))

            ],
          )

      );
    }else{
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
                onPressed: (int index){
                  setState(() {
                    for(int i=0;i<isSelect.length;i++){
                      if(i == index){
                        isSelect[i] = true;
                        if(i==0){
                          login = true;
                          signup = false;
                        }
                        if(i==1){
                          signup = true;
                          login = false;
                        }
                      }else{
                        isSelect[i] = false;
                      }
                    }

                  });
                },
              ),
              Form(
                  key:_formKey,
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2.0),
                            ),
                            hintText:'enter name'
                        ),
                        validator: (val){
                          if(val == null || val.isEmpty){
                            return 'Please enter UserName';
                          }
                        },

                      ),
                      TextFormField(
                        decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2.0),
                            ),
                            hintText:'registration number'
                        ),
                        validator: (val){
                          if(val == null || val.isEmpty){
                            return 'Please enter registration number';
                          }
                        },

                      ),
                      TextFormField(

                          decoration:new InputDecoration(
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2.0),
                            ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black, width: 2.0),
                              ),
                              labelText: 'E-Mail'),
                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (value) {
                            //Validator
                          },

                        ),

                      DropdownButtonFormField(
                        decoration:new InputDecoration(
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 2.0),
                          ),
                        ),
                        items:
                      state.map<DropdownMenuItem<String>>((e) { return(
                          DropdownMenuItem( child: Text(e.toString()),value: e,));
                      }
                      ).toList(),
                        value: stateValue,
                        onChanged: (value){
                          setState(() {
                            stateValue = value.toString();
                          });
                        },

                      ),


                      DropdownButtonFormField(
                        decoration:new InputDecoration(
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 2.0),
                          ),
                        ),
                        items:
                      district.map<DropdownMenuItem<String>>((e) { return(
                          DropdownMenuItem( child: Text(e.toString()),value: e,));
                      }
                      ).toList(),
                        value: districtValue,
                        onChanged: (value){
                          setState(() {
                            districtValue = value.toString();
                          });
                        },

                      ),


                      DropdownButtonFormField(
                        decoration:new InputDecoration(
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 2.0),
                          ),
                        ),
                        items:
                      thalluk.map<DropdownMenuItem<String>>((e) { return(
                          DropdownMenuItem( child: Text(e.toString()),value: e,));
                      }
                      ).toList(),
                        value: thallukValue,
                        onChanged: (value){
                          setState(() {
                            thallukValue = value.toString();
                          });
                        },
                      ),
                      TextFormField(
                        decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2.0),
                            ),
                            hintText:'pincode'
                        ),
                        validator: (val){
                          if(val == null || val.isEmpty){
                            return 'Please enter pincode';
                          }
                        },

                      ),
                      TextFormField(
                        decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2.0),
                            ),
                            hintText:'Addressline'
                        ),
                        validator: (val){
                          if(val == null || val.isEmpty){
                            return 'Please enter Addressline';
                          }
                        },

                      ),
                      PasswordField(
                        hasFloatingPlaceholder: true,
                        pattern: r'.*[@$#.*].*',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: BorderSide(width: 2, )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 2, )),
                        errorMessage: 'must contain special character either . * @ # \$',
                      ),
                      PasswordField(
                        hasFloatingPlaceholder: true,
                        hintText: ('Confirm Password'),
                        pattern: r'.*[@$#.*].*',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: BorderSide(width: 2, )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 2, )),
                        errorMessage: 'must contain special character either . * @ # \$',
                      ),

                        ElevatedButton(
                         onPressed: () {

                                if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(content: Text('Processing Data')));
                                }
                                },
                          child:
                            Text('Submit'),


                            ),
                    ],
                  ))
            ],
          ),
        ),

      );
    }



  }
}
