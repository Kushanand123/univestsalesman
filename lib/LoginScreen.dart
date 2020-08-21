import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

import 'HomeScreen.dart';
int createdby;
var  userid;
var getuser;
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

//
class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool isShow = false;
  final TextEditingController passwordController = TextEditingController();
  SharedPreferences prefs;
   var rsp;
   var convertedDatatoJson;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future loginUser(String email, String password) async {
    String url = 'https://dashboard.univest.com.sa/public/api/login';
    final response = await http.post(
      url,
      headers: {'Accept': 'Application/json'},
      body: {'email': email, 'password': password },
    );
  convertedDatatoJson = jsonDecode(response.body);
//print(convertedDatatoJson);

//print(convertedDatatoJson['success']['user_id']);
 return convertedDatatoJson;
  }

   void  saveStr() async {
       final SharedPreferences pref = await SharedPreferences.getInstance();
    //  pref.setString('email', email);
    //  pref.setString('password', password);
    pref.setString('userid', userid);
      print('value is save in local storage...');
    }


 void  readPrefStr(BuildContext context) async {
        final SharedPreferences pref = await SharedPreferences.getInstance();
         getuser = pref.getString('userid');
        print(getuser);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/univest blue3.png')),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                        fontSize: 24,
                        color: Color(0xff29487d),
                        fontWeight: FontWeight.w500),
                  )),
              Form(
                  key: formkey,
                  child: Column(children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          // prefixIcon: Icon(Icons.mail),
                          //  border: OutlineInputBorder(),
                          labelText: 'Email Id/Employe Id',
                        ),
                        controller: emailController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Email cannot be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          // prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                              icon: Icon(isShow
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  isShow = !isShow;
                                });
                              }),
                          // border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                        obscureText: !isShow,
                        controller: passwordController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Password cannot be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                  ])),

              FlatButton(
                onPressed: () {
                  //forgot password screen
                },
                textColor: Colors.black,
                child: Text('Forgot Password?'),
              ),
              // Container(
              //   child: Column(
              //     children: <Widget>[
              Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Color(0xff29487d),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () async {
                    
                      if (formkey.currentState.validate()) {
                        var email = emailController.text;
                        var password = passwordController.text;
                    
                        setState(() {
                       Toast.show('Please wait.....', context,
                 duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
              
                         // message = 'Please wait.....';
                        });
                         rsp = await loginUser(email, password );
                        print(rsp);

                        if (rsp.containsKey('code')) {
                         
                          setState(() {
                           Toast.show(rsp['code_text'], context,
                duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                         //   message = rsp['code_text'];
                          });
                      
                          if (rsp['code'] == 200) {
                       SharedPreferences prefs = await SharedPreferences.getInstance();
                           prefs?.setBool("isLoggedIn", true);
                         userid = convertedDatatoJson['success']['user_id'];
                            saveStr();
                           readPrefStr(context);
                            Navigator.push(
                             context,
                               MaterialPageRoute(
                            builder: (context) => HomeScreen(dataholder : getuser)));
                          } else {
                            setState(() {
                        Toast.show('Login Failed', context,
                 duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                            //  message = 'Login Failed';
                            });
                          }
                       
                      }
                    }})),
                  
              SizedBox(
                height: 10,
              ),

           //   Center(child: Text(message))
            ],
          ),
        ),
      ),
    ));
  }
}

