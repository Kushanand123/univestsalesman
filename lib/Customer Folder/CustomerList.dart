
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'ShowCustomerProfile.dart';

class ClientList2 extends StatefulWidget {


  @override
  _ClientList2State createState() => _ClientList2State();
}

class _ClientList2State extends State<ClientList2> {


  bool isSearching = false;
  List<UserDetails> _users = List<UserDetails>();
  List<UserDetails> usersForDisplay = List<UserDetails>();
 
  @override
  void initState(){
  //  getData();
  fetchUsers().then((data){
  setState((){
   //  _users.addAll(data);
   _users = usersForDisplay =data;

  });
  });
    super.initState();
  }

  void _usersForDisplay(value){
    setState(() {
     usersForDisplay = _users.where((user)=> user.name.toLowerCase().contains(value.toLowerCase()) || user.email.toLowerCase().contains(value.toLowerCase()) || user.mobile.toLowerCase().contains(value.toLowerCase())).toList();
      }
      
    );

  }
Future<List<UserDetails>> fetchUsers() async{
 String url =   "https://dashboard.univest.com.sa/public/api/getcustomers";
 var response = await http.get(url);
 var users = List<UserDetails>();

 if(response.statusCode == 200){
   var usersJson = json.decode(response.body)['success'];
   for (var userJson in usersJson){
     users.add(UserDetails.fromJson(userJson));
   }
 }
 return users;
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
      
          elevation: 0.7,
          backgroundColor: Colors.white,
          title: !isSearching
              ?  Text(
                  'All Customers',
                  style: TextStyle(color: Color(0xff29487d)),
                )
              :    TextField(
                    onChanged: (value){
                       _usersForDisplay(value);
                    },
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
                  //  centerTitle: true,
              // _searchBar(),
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
                        usersForDisplay = _users;
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
           child: Padding(
              padding: EdgeInsets.all(2),
          child: usersForDisplay.length >0
          ?

               ListView.builder(
                          itemCount: usersForDisplay.length,
                          itemBuilder: (context,  i){
                            return   ListTile(
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
                                        image: NetworkImage(usersForDisplay[i].profilePic
                                    //   userData[i]['name']
                                        ),
                                          width: 45,
                                        height: 45,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                     usersForDisplay[i].name ,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Text(usersForDisplay[i].email ,
                                    style: TextStyle(color: Colors.grey)),
                                trailing: Text(
                                  usersForDisplay[i].mobile ,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditProfile(
                                            itemholder: usersForDisplay[i]
                                   
                                          )));
                                },
                              );
                          }
                   
                              ):
                              Center(child: CircularProgressIndicator())
                            )
                         )));
                         
  }
                  
  }
class UserDetails {
 
  final String name, mobile, email, profilePic,altmobile,address, country,state,city,remarks,status;
  final int id;

  UserDetails({ this.name, this.mobile,this.email, this.profilePic , this.altmobile, this.address, this.country, this.state, this.city, this.remarks, this.status, this.id});

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return new UserDetails(
      id: json['id'],
      name: json['name'],
      mobile: json['mobile'],
      email: json['email'],
      profilePic: json['profile_pic'],
      altmobile: json['alt_mobile'],
      address: json['address'],
      country: json['country'],
      state: json['state'],
      city: json['city'],
      remarks: json['remarks'],
      status: json['status'],
    );
  }
}
