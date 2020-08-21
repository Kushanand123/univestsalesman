
import 'package:flutter/material.dart';

import 'Customer Folder/CustomerList.dart';
import 'Customer Folder/CreateCustomer.dart';
import 'Receipt Folder/CreateReceipt.dart';
import 'LoginScreen.dart';

class HomeScreen extends StatefulWidget {
    String dataholder;
   HomeScreen({Key key, @required this.dataholder}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool customer = false;
  bool receipt = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Color(0xff29487d)),
            title: Text("Home Screen",
                style: TextStyle(
                  color: Color(0xff29487d),
                ))),
        body: SafeArea(
            child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: ListView(children: <Widget>[
                  //-------------------------------------------------------------------------------------------
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Container(
                      height: 235,
                      width: MediaQuery.of(context).size.width * 0.95,
                      color: Colors.grey[400].withOpacity(0.7),
                      child: Stack(children: <Widget>[
                        Positioned(
                          top: 0,
                          child: Container(

                              child: Image(
                                  height: 110,
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  image: AssetImage(
                                    'assets/home1.png',
                                  ),
                                  fit: BoxFit.fill)
                              //     Text("Home pic1")
                              ),
                        ),

                        Container(
                          //  color: Colors.white,
                          //   child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                  width: 150,
                                  //  color: Colors.blue[100],
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.9),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text(
                                            'Salesman',
                                            style: TextStyle(fontSize: 12),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text(
                                            'Customer',
                                            style: TextStyle(fontSize: 12),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text(
                                            'Segment',
                                            style: TextStyle(fontSize: 12),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text(
                                            'Order Value',
                                            style: TextStyle(fontSize: 12),
                                          )),
                                    ],
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  width: 150,
                                  //   color: Colors.blue[200],
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text('0')),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text('0')),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text('0')),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text('0')),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        //      ),
                      ]),
                    ),
                  ),
                  //---------------------------------------------------------------------------------------------------------------------------------------
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Container(
                      height: 235,
                      width: MediaQuery.of(context).size.width * 0.95,
                      color: Colors.grey[400].withOpacity(0.7),
                      child: Stack(children: <Widget>[
                        Positioned(
                          top: 0,
                          child: Container(
                              decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  //  border: Border.all(width: 2),
                                  ),
                              //  padding: const EdgeInsets.all(0),
                              child: Image(
                                  height: 110,
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  image: AssetImage(
                                    'assets/home 2.png',
                                  ),
                                  fit: BoxFit.fill)
                              //     Text("Home pic1")
                              ),
                        ),

                        Container(
                          //  color: Colors.white,
                          //   child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                  width: 150,
                                  //  color: Colors.blue[100],
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.9),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text(
                                            'Salesman',
                                            style: TextStyle(fontSize: 12),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text(
                                            'Customer',
                                            style: TextStyle(fontSize: 12),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text(
                                            'Segment',
                                            style: TextStyle(fontSize: 12),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text(
                                            'Order Value',
                                            style: TextStyle(fontSize: 12),
                                          )),
                                    ],
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  width: 150,
                                  //   color: Colors.blue[200],
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text('0')),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text('0')),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text('0')),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text('0')),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        //      ),
                      ]),
                    ),
                  ),
                  //---------------------------------------------------------------------------------------------------------------------------------------
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Container(
                      height: 235,
                      width: MediaQuery.of(context).size.width * 0.95,
                      color: Colors.grey[400].withOpacity(0.7),
                      child: Stack(children: <Widget>[
                        Positioned(
                          top: 0,
                          child: Container(
                              decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  //  border: Border.all(width: 2),
                                  ),
                              //  padding: const EdgeInsets.all(0),
                              child: Image(
                                  height: 110,
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  image: AssetImage(
                                    'assets/home3.png',
                                  ),
                                  fit: BoxFit.fill)
                              //     Text("Home pic1")
                              ),
                        ),

                        Container(
                          //  color: Colors.white,
                          //   child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                  width: 150,
                                  //  color: Colors.blue[100],
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.9),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text(
                                            'Salesman',
                                            style: TextStyle(fontSize: 12),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text(
                                            'Customer',
                                            style: TextStyle(fontSize: 12),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text(
                                            'Segment',
                                            style: TextStyle(fontSize: 12),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text(
                                            'Order Value',
                                            style: TextStyle(fontSize: 12),
                                          )),
                                    ],
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  width: 150,
                                  //   color: Colors.blue[200],
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text('0')),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text('0')),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text('0')),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text('0')),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        //      ),
                      ]),
                    ),
                  ),
//---------------------------------------------------------------------------------------------------------------------------------------------------
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Container(
                      height: 235,
                      width: MediaQuery.of(context).size.width * 0.95,
                      color: Colors.grey[400].withOpacity(0.7),
                      child: Stack(children: <Widget>[
                        Positioned(
                          top: 0,
                          child: Container(
                              decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  //  border: Border.all(width: 2),
                                  ),
                              //  padding: const EdgeInsets.all(0),
                              child: Image(
                                  height: 110,
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  image: AssetImage(
                                    'assets/home4.png',
                                  ),
                                  fit: BoxFit.fill)
                              //     Text("Home pic1")
                              ),
                        ),

                        Container(
                          //  color: Colors.white,
                          //   child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                  width: 150,
                                  //  color: Colors.blue[100],
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.9),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text(
                                            'Salesman',
                                            style: TextStyle(fontSize: 12),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text(
                                            'Customer',
                                            style: TextStyle(fontSize: 12),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text(
                                            'Segment',
                                            style: TextStyle(fontSize: 12),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text(
                                            'Order Value',
                                            style: TextStyle(fontSize: 12),
                                          )),
                                    ],
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  width: 150,
                                  //   color: Colors.blue[200],
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text('0')),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text('0')),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text('0')),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text('0')),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        //      ),
                      ]),
                    ),
                  ),
                ]))),
        drawer: Drawer(
          child: Column(children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(30),
             color: Color(0xff29487d),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        border: Border.all(width: 3, color: Colors.white),
                      ),
                      child: Container(
                  
                        padding: EdgeInsets.all(
                          2,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(70),
                          child: Image(
                            
                            image: AssetImage('assets/univest blue.png'),
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Kush Anand",
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                        child: Row(
                      children: <Widget>[
                        Text(
                          "Edit Profile",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        IconButton(
                            icon: Icon(Icons.edit, color: Colors.white),
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => EditProfile(),
                              //     ));
                            })
                      ],
                    ))
                  ]),
            ),
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(fontSize: 18),
              ),
              leading: Icon(
                
                Icons.home,
                size: 30,
           color: Color(0xff29487d),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen(dataholder: getuser,)));
              },
            ),
            // ListTile(
            //   title: Text(
            //     'Customers',
            //     style: TextStyle(fontSize: 18),
            //   ),
            //   leading: Icon(
            //     Icons.search,
            //     size: 30,
            // color: Color(0xff29487d),
            //   ),
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => Field()));
             // },
           // ),
            //      ListTile(
            //   title: Text(
            //     'Add New Customer',
            //     style: TextStyle(fontSize: 14),
            //   ),
            //   leading: Icon(
            //     Icons.person_add,
            //     size: 30,
            //     color: Color(0xff29487d),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (context) => Create(dataitem : widget.dataholder)));
            //   },
            // ),
            // ListTile(
            //   title: Text(
            //     'Search Customers',
            //     style: TextStyle(fontSize: 14),
            //   ),
            //    leading: Icon(
            //     Icons.search,
            //     size: 30,
            //   color: Color(0xff29487d),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //      context, MaterialPageRoute(builder: (context) => ClientList2()));
            //   },
            // ),
      
       
          ExpansionTile(title: customer==false ? Text('Customer', style: TextStyle(fontSize: 18), ) :
           Text('Customer', style: TextStyle(fontSize: 18, color: Colors.black)) ,
          initiallyExpanded: customer,
          onExpansionChanged: (value){
            setState(() {
                customer = value;
            });
          
          },
          children: <Widget>[
               ListTile(
              title: Text(
                'Add New Customer',
                style: TextStyle(fontSize: 14),
              ),
              leading: Icon(
                Icons.person_add,
                size: 30,
                color: Color(0xff29487d),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Create(dataitem : widget.dataholder)));
              },
            ),
            ListTile(
              title: Text(
                'Search Customers',
                style: TextStyle(fontSize: 14),
              ),
               leading: Icon(
                Icons.search,
                size: 30,
              color: Color(0xff29487d),
              ),
              onTap: () {
                Navigator.push(
                 context, MaterialPageRoute(builder: (context) => ClientList2()));
              },
            ),
          ],
          ),

          ExpansionTile(title: receipt==false ? Text('Receipt', style: TextStyle(fontSize: 18), ) :
           Text('Receipt', style: TextStyle(fontSize: 18, color: Colors.black)) ,
          initiallyExpanded: receipt,
          onExpansionChanged: (value){
            setState(() {
                receipt = value;
            });
          
          },
          children: <Widget>[
               ListTile(
              title: Text(
                'Add New Receipt',
                style: TextStyle(fontSize: 14),
              ),
              leading: Icon(
                Icons.person_add,
                size: 30,
                color: Color(0xff29487d),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Field()));
              },)])]))
            
       
         
          
        );
  }
}
