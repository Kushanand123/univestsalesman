import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:univestsalesman/Receipt%20Folder/EditReceipt.dart';
import 'package:univestsalesman/Receipt%20Folder/ShowReciptDetails.dart';
  List<UserReceipts> usersForDisplay = List<UserReceipts>();
class GetReceipts extends StatefulWidget {
  @override
  _GetReceiptsState createState() => _GetReceiptsState();
}

class _GetReceiptsState extends State<GetReceipts> {

    var usersForDisplay2;
  bool isSearching = false;
  List<UserReceipts> _users = List<UserReceipts>();
  List<UserReceipts> usersForDisplay = List<UserReceipts>();
 
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
     usersForDisplay = _users.where((user)=> user.receiptno.toLowerCase().contains(value.toLowerCase()) 
    //  || user.email.toLowerCase().contains(value.toLowerCase()) || user.mobile.toLowerCase().contains(value.toLowerCase())
     )
     .toList();
      }
      
    );

  }
Future<List<UserReceipts>> fetchUsers() async{
 String url =   "https://dashboard.univest.com.sa/public/api/getreceipts";
 var response = await http.get(url);
 var users = List<UserReceipts>();

 if(response.statusCode == 200){
   var usersJson = json.decode(response.body)['success'];
   for (var userJson in usersJson){
     users.add(UserReceipts.fromJson(userJson));
   }
 }
 return users;
}
  //   final String apiUrl =
  //     "https://dashboard.univest.com.sa/public/api/getreceipts";

  // Future<List<dynamic>> fetchUsers() async {
  //   var result = await http.get(apiUrl);
  //   return json.decode(result.body)['success'];
  // }

  // String _receiptnumber(dynamic user) {
  //   return user['receipt_no'];
  // }

  // String _amount(dynamic user) {
  //   return user['grand_total'];
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      
          elevation: 0.7,
          backgroundColor: Colors.white,
          title: !isSearching
              ?  Text(
                  'All Receipts',
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
//       child: Padding(
              padding: EdgeInsets.all(2),
          child: usersForDisplay.length >0
          ?

               ListView.builder(
                          itemCount: usersForDisplay.length,
                          itemBuilder: (context,  i){
                            return   Container(
             padding: EdgeInsets.all(10),
              child: Card(
             color: Colors.blue[50],
     elevation: 4,
   shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10))
  ),
  child: ListTile(
    title: Text('Customer Name', style: TextStyle(fontSize: 18)),
    subtitle: Text( usersForDisplay[i].receiptno, style: TextStyle(fontSize: 14)),
    trailing: Column(
      children: [
        Text('SAR', style: TextStyle(fontSize: 18)),
        SizedBox(height: 8),
        Text( usersForDisplay[i].grandtotal, style: TextStyle(fontSize: 16)
  ),
      ],
    ),
     onTap: () {
            Navigator.push(
           context,
         MaterialPageRoute(
         builder: (context) => Receipt(
       itemholder: usersForDisplay[i]                          
         )));
                       },
),

));}):
  Center(child: CircularProgressIndicator())
                    )    
      ),
    );
  }
}

class UserReceipts {
 
  final String receiptno, subtotal, discount,shipping, tax,grandtotal,paid,balancedue,paymentdetails, notes, customersign;

  UserReceipts({ this.receiptno, this.subtotal, this.discount, this.shipping, this.tax, this.grandtotal, this.paid, this.balancedue, this.paymentdetails, this.notes, this.customersign});

  factory UserReceipts.fromJson(Map<String, dynamic> json) {
    return  UserReceipts(
     
      receiptno: json['receipt_no'],
      subtotal: json['subtotal'],
      discount: json['discount'],
      shipping: json['shipping'],
      tax: json['tax'],
      grandtotal: json['grand_total'],
      paid: json['paid'],
      balancedue: json['balancedue'],
      paymentdetails: json['payment_details'],
       notes: json['notes'],
    customersign: json['customer_sign']
    );
  }
}


              