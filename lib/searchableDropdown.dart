import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class SearchDropdown extends StatefulWidget {
  @override
  _SearchDropdownState createState() => _SearchDropdownState();
}

class _SearchDropdownState extends State<SearchDropdown> {
    String selectedValue;
    List data = List();
 //final String url = 'https://dashboard.univest.com.sa/public/api/getcustomers';
      // Future getCustomerName() async {
      //   var res = await http.get(url, headers: {"Accept": "application/json"});
      //   var resBody = json.decode(res.body)['success'];
      //   setState(() {
      //     print('-------------------------------------------------------------');
      //     print(resBody.runtimeType);
      //     print(resBody);
      //     data = resBody;
      //   });
      //   return 'Success';
      // }
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
  //        @override
  // void initState() {
  //   super.initState();
  //  fetchUsers();
  // }
  

     List<UserDetails> _users = List<UserDetails>();
  List<UserDetails> usersForDisplay = List<UserDetails>();
  @override
  void initState(){

  fetchUsers().then((data){
  setState((){

   _users = usersForDisplay =data;

  });
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Searchable DropDown')
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            children:<Widget>[
            Center(child: 
            Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,

              )
            ),
              child: DropdownButtonHideUnderline(
          child: SearchableDropdown( 
                underline: Padding(
        padding: EdgeInsets.all(5),
      ),
    items: usersForDisplay.map(
        (val) {
                return DropdownMenuItem<UserDetails>(
                 value: val,
                //value : val.name,
                  child: Text(val.name),
                );
        },
      ).toList(),
         isCaseSensitiveSearch: true,
   
      onChanged: ( val) {
        setState(
                () {
                  if(val!=0){
                   selectedValue = val.id.toString();
                  }
                
                  print(selectedValue);
                },
        );
      },  

        hint: "Select one",
        searchHint: null,
        dialogBox: false,
        isExpanded: true,
        menuConstraints: BoxConstraints.tight(Size.fromHeight(350)),
      ),
              ),
            )
            ),]
          )
        )),
    );
  }
}

class UserDetails {
 
  final String name;
  final int id;

  UserDetails({ this.name, this.id});

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return new UserDetails(
      id: json['id'],
      name: json['name'],
    
    );
  }
    @override
  String toString() {
    return '$name $id';
  }
  }