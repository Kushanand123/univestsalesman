import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:univestsalesman/Receipt%20Folder/EditReceipt.dart';
import 'package:univestsalesman/duplicatefiles/dropdown.dart';
import 'package:univestsalesman/Receipt%20Folder/ShowReciptDetails.dart';
import 'package:univestsalesman/searchableDropdown.dart';
import 'Receipt Folder/ReceiptList.dart';
import 'Receipt Folder/CreateReceipt.dart';
import 'HomeScreen.dart';
import 'LoginScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
   //  home: SplashScreen()
 home: Field()
  // home: Receipt()

 //home: GetReceipts(),
// home: Dropdown(),
//home: SearchDropdown(),

    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () =>   navigateUser());
        
        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (BuildContext context) => Login()))
            
  }

    void navigateUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;
    print(status);
    if (status) {
   Navigator.of(context).pushReplacement(
         MaterialPageRoute(builder: (BuildContext context) => HomeScreen(dataholder: getuser,)));
    } else {
 Navigator.of(context).pushReplacement(
         MaterialPageRoute(builder: (BuildContext context) => Login()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
        body: SafeArea(
      child: Container(
     height: MediaQuery.of(context).size.height,
          child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ColorFiltered(
              child: Image.asset(
                'assets/univest screenshot.jpg',
                fit: BoxFit.cover,
              ),
              colorFilter:
                  ColorFilter.mode(Color(0xff29487d), BlendMode.colorDodge),
            ),
          ),
          Positioned(
              top: 260,
              bottom: 200,
              //     //  left: 40,
              //  Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Image.asset('assets/univest logo july.png'),
              ))
        ],
      )),
    ));
  }
}
