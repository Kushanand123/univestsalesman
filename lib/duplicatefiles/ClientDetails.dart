import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'EditProfile.dart';

class ClientList extends StatefulWidget {
  @override
  _ClientListState createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  bool isSearching = false;


  @override
  void initState() {
    fetchUsers().then((data) {
      setState(() {
  
      });
    });

    super.initState();
  }

  // void _filteredCustomers(value) {
  //   fiteredCustomers = fetchUsers.where((success)=>success[_name] = );
  // }

  final String apiUrl =
      "https://dashboard.univest.com.sa/public/api/getcustomers";

  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(apiUrl);
    return json.decode(result.body)['success'];
  }

  String _name(dynamic user) {
    return user['name'];
  }

  String _email(dynamic user) {
    return user['email'];
  }

  String _mobile(dynamic user) {
    return user['mobile'];
  }

   String _profilepic(dynamic user) {
    return user['profile_pic'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //  bottom: PreferredSize.,
          // centerTitle: true,
          elevation: 0.7,
          backgroundColor: Colors.white,
          title: !isSearching
              ? Text(
                  'All Customers',
                  style: TextStyle(color: Color(0xff29487d)),
                )
              :
           
              TextField(
                  onChanged: (value) {},
                  style: TextStyle(
                      fontSize: 15.0, height: 1.2, color: Colors.black),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        size: 30,
                        color: Color(0xff29487d),
                      ),
                      hintText: "Search Customers",
                      hintStyle: TextStyle(
                        color: Color(0xff29487d),
                      )),
                ),
          //  ),
          actions: [
            isSearching
                ? IconButton(
                    iconSize: 30,
                    icon: Icon(
                      Icons.cancel,
                      color: Color(0xff29487d),
                      // color: Colors.blue,
                    ),
                    onPressed: () {
                      setState(() {
                        this.isSearching = false;
                      });
                    })
                : IconButton(
                    iconSize: 30,
                    icon: Icon(
                      Icons.search,
                      color: Color(0xff29487d),
                      // color: Colors.blue,
                    ),
                    onPressed: () {
                      setState(() {
                        this.isSearching = true;
                      });
                    })
          ],
        ),
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            //  color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(2),
              child: FutureBuilder<List<dynamic>>(
                future: fetchUsers(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    //  print(_age(snapshot.data[0]));
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, int i) => ListTile(
                              leading: Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(70),
                                  border:
                                      Border.all(width: 3, color: Colors.green),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(
                                    2,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(70),
                                    child: Image(
                                      image: NetworkImage(
                                          _profilepic(snapshot.data[i])),
                                        width: 45,
                                      height: 45,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(
                                _name(snapshot.data[i]),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text(_email(snapshot.data[i]),
                                  style: TextStyle(color: Colors.grey)),
                              trailing: Text(
                                _mobile(snapshot.data[i]),
                                style: TextStyle(color: Colors.grey),
                              ),
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => EditProfile()));
                              },
                            ));

             
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            //   print(_age(snapshot.data[0]));
          ),
        ));
  }
}
