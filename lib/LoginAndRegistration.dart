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
  bool login = true;
  bool signup = false;
  List<bool> isSelect = [true,false];
  final _formKey = GlobalKey<FormState>();
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
                        validator: (val){
                          if(val == null || val.isEmpty){
                            return 'Please enter UserName';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'UserName'
                        ),
                      ),
                      TextFormField(
                        validator: (val){
                          if(val == null || val.isEmpty){
                            return 'Please enter Password';
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Password'
                        ),

                      ),
                      ElevatedButton(
                          onPressed: (){

                            },
                          child: Text('Submit'),
                      )
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
                  child: Wrap(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [
                      TextFormField(
                        validator: (val){
                          if(val == null || val.isEmpty){
                            return 'Please enter UserName';
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter School Name'
                        ),
                      ),
                      TextFormField(
                        validator: (val){
                          if(val == null || val.isEmpty){
                            return 'Please enter Password';
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter Reg Number'
                        ),

                      ),
                      TextFormField(
                        validator: (val){
                          if(val == null || val.isEmpty){
                            return 'Please enter Password';
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter Reg Number'
                        ),

                      ),
                      TextFormField(
                        validator: (val){
                          if(val == null || val.isEmpty){
                            return 'Please enter Password';
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter Reg Number'
                        ),

                      ),
                      TextFormField(
                        validator: (val){
                          if(val == null || val.isEmpty){
                            return 'Please enter Password';
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter Reg Number'
                        ),

                      ),
                      TextFormField(
                        validator: (val){
                          if(val == null || val.isEmpty){
                            return 'Please enter Password';
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter Reg Number'
                        ),

                      ),
                      TextFormField(
                        validator: (val){
                          if(val == null || val.isEmpty){
                            return 'Please enter Password';
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter Reg Number'
                        ),

                      ),
                      TextFormField(
                        validator: (val){
                          if(val == null || val.isEmpty){
                            return 'Please enter Password';
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter Reg Number'
                        ),

                      ),
                      ElevatedButton(
                        onPressed: (){

                        },
                        child: Text('Submit'),
                      )
                    ],
                  ))
            ],
          )

      );
    }



  }
}