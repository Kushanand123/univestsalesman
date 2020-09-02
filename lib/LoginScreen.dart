import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';
import 'package:univestsalesman/CommanUtils.dart';
import 'package:univestsalesman/JsonKey.dart';
import 'package:univestsalesman/PrefKey.dart';
import 'HomeScreen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {

  final TextEditingController emailController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool isShow = false;
  final TextEditingController passwordController = TextEditingController();

//------------ Dispose method--------------------
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

//--------------------- Api Function------------------------
static Future<Map> loginUser(String email, String password) async {
    String url = 'https://dashboard.univest.com.sa/public/api/login';
    final response = await http.post( url, headers: {'Accept': 'Application/json'},
     body: {'email': email, 'password': password }, );
    if(response!=null && response.statusCode==200){
      Map map =jsonDecode(response.body);
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${response.body}");
       CommonUtils.savePref(PrefKey.userId, map[JsonKey.SUCCESS][JsonKey.userId]);

      return map;
    }
 return null;
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
                          suffixIcon: IconButton(
                              icon: Icon(isShow
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  isShow = !isShow;
                                });
                              }),
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
                },
                textColor: Colors.black,
                child: Text('Forgot Password?'),
              ),
       
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
                 loginUser(emailController.text,  passwordController.text);
                   SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs?.setBool("isLoggedIn", true);
                          Navigator.push(
                             context,
                               MaterialPageRoute(
                            builder: (context) => HomeScreen(
                            )));
          
                   }
                    })),
           
            ],
          ),
        ),
      ),
    ));
  }
}

