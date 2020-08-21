import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:searchable_dropdown/searchable_dropdown.dart';

import 'ReceiptList.dart';


class Field extends StatefulWidget {
  // final UserDetails itemholder;
  //  Field({Key key, @required this.itemholder }) : super(key: key);
  @override
  _FieldState createState() => _FieldState();
}

class _FieldState extends State<Field> {


  TextEditingController subtotalController = TextEditingController();
 TextEditingController discountController = TextEditingController();
 TextEditingController shippingController = TextEditingController();
 TextEditingController taxController = TextEditingController();
TextEditingController  grandtotalController = TextEditingController();
 TextEditingController paidController = TextEditingController();
TextEditingController balancedueController = TextEditingController();
TextEditingController paymentdetailsController = TextEditingController();
TextEditingController notesController = TextEditingController();
TextEditingController signController = TextEditingController();
TextEditingController customeridController = TextEditingController();
TextEditingController createdbyController = TextEditingController();
List<TextEditingController> itemnameController = List.generate(100, (index) => TextEditingController());
List<TextEditingController> quantityController = List.generate(100, (index) => TextEditingController());
List<TextEditingController> priceController = List.generate(100, (index) => TextEditingController());


var name = List<String> ();
var quantity = List<String> ();
var price = List<String> ();
int i;
int j;
 var _fields = List<Widget>();
  int index = 1;
  
  // void removeItem() {
  //   setState(() {
  //     _fields = List.from(_fields).removeAt(index);
  //   });
  // }

//------------------------------------------------ Add More Textfield function -----------------------------------------------------------------

  void add() {
    _fields = List.from(_fields)
      ..add(
        index != 1
          ? Column(children: <Widget>[
           Container(
            height: 50,
            child: Row(children: <Widget>[

                   Expanded(
                   child: Container(
                  width: 100,
                  height: 35,
             
                  child: TextField(
                      style: TextStyle(
                          fontSize: 12.0, height: 1.2, color: Colors.black),
                          controller: itemnameController[index],
                            onChanged: (String text){
                              name = List.from(name)..add(text);
                              },
                        // setState(() {
                         // for(j = 0; j < 4; j++){
                        // name[j] = text;
                    //  }
                      //  });
                        
                          // },
                      decoration:  InputDecoration(
                          fillColor: Colors.grey[200],
                          filled: true,
                          border:  OutlineInputBorder(
                              borderSide:  BorderSide(color: Colors.black)),
                          hintText: 'Item Name',
                          hintStyle: TextStyle(fontSize: 10))),
                ),
              ),
              SizedBox(
                width: 5,
              ),

                 Expanded(
                   flex:1,
                  child: Container(
               width: 100,
                height: 35,
           
                child: TextField(
                  controller: quantityController[index],
                     onChanged: (String text){
                      quantity = List.from(quantity)..add(text);},
                      style: TextStyle(
                          fontSize: 12.0, height: 1.2, color: Colors.black),
                      decoration: new InputDecoration(
                   fillColor: Colors.grey[200],
                          filled: true,
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black)),
                          hintText: 'Quantity',
                          hintStyle: TextStyle(fontSize: 10))),
              ),
                 ),
                   SizedBox(
                width: 5,
              ),

                 Expanded(
                   flex: 1,
                   child: Container(
                width: 100,
                height: 35,
             
                child: TextField(
                  controller: priceController[index] ,
                     onChanged: (String text){
                     price = List.from(price)..add(text);},
                      style: TextStyle(
                          fontSize: 12.0, height: 1.2, color: Colors.black),
                      decoration: new InputDecoration(
                     fillColor: Colors.grey[200],
                          filled: true,
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black)),
                          hintText: 'Item Price',
                          hintStyle: TextStyle(fontSize: 10))),
              ),
                 ),

                  IconButton(
                //  color: Colors.red,
                icon: Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    _fields.removeWhere((item) {
            return item.key == _fields[index].key;
          });
                  //  _fields.removeLast();
                  });
                }),
     
        
           ],
             ),),
               SizedBox(
          height: 10,
        ),
             ],
           
            )
           :
          Column(children: <Widget>[
        Container(
  
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Expanded(
                   child: Container(
                  width: 100,
                  height: 35,
             
                  child: TextField(
                      style: TextStyle(
                          fontSize: 12.0, height: 1.2, color: Colors.black),
                      decoration: new InputDecoration(
                          fillColor: Colors.grey[200],
                          filled: true,
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black)),
                          hintText: 'Item Name',
                          hintStyle: TextStyle(fontSize: 10))),
                ),
              ),
              SizedBox(
                width: 5,
              ),

                 Expanded(
                   flex:1,
                  child: Container(
               width: 100,
                height: 35,
            
                child: TextField(
                      style: TextStyle(
                          fontSize: 12.0, height: 1.2, color: Colors.black),
                      decoration: new InputDecoration(
                   fillColor: Colors.grey[200],
                          filled: true,
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black)),
                          hintText: 'Quantity',
                          hintStyle: TextStyle(fontSize: 10))),
              ),
                 ),
                   SizedBox(
                width: 5,
              ),

                 Expanded(
                   flex: 1,
                   child: Container(
                width: 100,
                height: 35,
             
                child: TextField(
                      style: TextStyle(
                          fontSize: 12.0, height: 1.2, color: Colors.black),
                      decoration: new InputDecoration(
                     fillColor: Colors.grey[200],
                          filled: true,
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black)),
                          hintText: 'Item Price',
                          hintStyle: TextStyle(fontSize: 10))),
              ),
                 ),
              SizedBox(
                height: 10,
              ),

              IconButton(
                onPressed: add,
                icon: Icon(Icons.add),
              color: Colors.green,
              )
                ],
               )
               )
            ])
      );
    setState(() => ++index);
  }

// Signature Pad Controller---------------------------------------------------- 
    final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.red,
    exportBackgroundColor: Colors.blue,
  );

// Initstate function ---------------------
  @override
  void initState() {
    super.initState();
 
  fetchUsers().then((data){
  setState((){

   usersForDisplay =data;

  });
  });
     _controller.addListener(() => print("Value changed"));
    add();
  }

// Build function -----------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
           iconTheme: IconThemeData(
         color: Color(0xff29487d)
          ),
          title: Text('Add Details', style: TextStyle(  color: Color(0xff29487d)),
        ),),
        body: SafeArea(
            child: Container(

                // color: Colors.amber[50],
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.all(10),             
                  child: ListView(children: <Widget>[
                    Center(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        textColor: Colors.white,
                        color: Color(0xff29487d),
                        child: Text(
                          'Add More',
                          style: TextStyle(fontSize: 16),
                        ),
                        onPressed: add,
                      ),
                    ),
                      SizedBox(
                  height : 20,
                    ),
               Container(
                  decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xff29487d),
                width: 1,

              )
            ),
                 child: DropdownButtonHideUnderline(
            child: SearchableDropdown( 
              iconSize: 30,
              underline:Padding(
        padding: EdgeInsets.all(0),
      ),
    items: usersForDisplay.map(
        (val) {
            return DropdownMenuItem<UserDetails>(
              value: val,
         //    value: val['name'],
              child: Text(val.name),
            );
        },
      ).toList(),
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
 
        value: selectedValue,
        hint: "Customer Name",
        searchHint: null,
        dialogBox: false,
        isExpanded: true,
        menuConstraints: BoxConstraints.tight(Size.fromHeight(350)),
      ),
                 ),
               ),
               
                   SizedBox(
                      height: 20,
                    ),
                    Column(children: _fields),
                  Form(
                    child: Column(
                      children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                             controller: subtotalController,
                        decoration: InputDecoration(
                            // labelText: 'Subtotal',
                            hintText: 'Subtotal'),
                          validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Subtotal cannot be empty';
                                  }
                                  return null;
                                },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                          controller: discountController,
                        decoration: InputDecoration(
                            // labelText: 'Subtotal',
                            hintText: 'Discount'),
                        validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Discount cannot be empty';
                                  }
                                  return null;
                                },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                         controller: shippingController,
                        decoration: InputDecoration(
                            // labelText: 'Subtotal',
                            hintText: 'Shipping'),
                        validator: (value) {
                            if (value.isEmpty) {
                           return 'Shipping cannot be empty';
                               }
                           return null;
                                },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                          controller: taxController,
                        decoration: InputDecoration(
                            // labelText: 'Subtotal',
                            hintText: 'Tax'),
                          validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Tax cannot be empty';
                                  }
                                  return null;
                                },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                          controller: grandtotalController,
                        decoration: InputDecoration(
                            // labelText: 'Subtotal',
                            hintText: 'Grand Total'),
                        validator: (value) {
                             if (value.isEmpty) {
                             return 'Grand Total cannot be empty';
                                }
                           return null;
                                },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: paidController,
                        decoration: InputDecoration(
                            // labelText: 'Subtotal',
                            hintText: 'Paid'),
                      validator: (value) {
                               if (value.isEmpty) {
                              return 'Paid cannot be empty';
                              }
                            return null;
                                },
                      ),
                    ),
                   
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                       controller: balancedueController,
                        decoration: InputDecoration(
                            // labelText: 'Subtotal',
                            hintText: 'Balance Due'),
                        validator: (value) {
                             if (value.isEmpty) {
                               return 'Balance Due cannot be empty';
                                  }
                                  return null;
                                },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                           controller: paymentdetailsController,
                        decoration: InputDecoration(
                            // labelText: 'Subtotal',
                            hintText: 'Payment Details'),
                        validator: (value) {
                            if (value.isEmpty) {
                                    return 'Payment Details cannot be empty';
                                  }
                                  return null;
                                },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                            controller: notesController,
                        decoration: InputDecoration(
                            // labelText: 'Subtotal',
                            hintText: 'Notes'),
                        validator: (value) {
                             if (value.isEmpty) {
                                 return 'Notes cannot be empty';
                               }
                             return null;
                                },
                      ),
                    ),
                     Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                            controller: signController,
                        decoration: InputDecoration(
                            // labelText: 'Subtotal',
                            hintText: 'Customer Sign'),
                        validator: (value) {
                             if (value.isEmpty) {
                                 return 'Customers Sign cannot be empty';
                               }
                             return null;
                                },
                      ),
                    ),
                
                       Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                            controller: createdbyController,
                        decoration: InputDecoration(
                            // labelText: 'Subtotal',
                            hintText: 'Created_by'),
                        validator: (value) {
                             if (value.isEmpty) {
                                 return 'Created_by cannot be empty';
                               }
                             return null;
                                },
                      ),
                    ),
                    ])),
              //       Container(
              //         padding: EdgeInsets.all(10),
              //         child: Text('Customer Signature Pad', style: TextStyle(fontSize: 18, color: Colors.grey[600]),)
                    
              //       ),

              //       //SIGNATURE CANVAS
              //       Container(
              //         decoration: BoxDecoration(
              //           border: Border.all(width: 2,  color: Color(0xff29487d), )
              //         ),
              //         child: Signature(
              //           controller: _controller,
              //           height: 200,
              //           backgroundColor: Colors.grey[200],
              //         ),
              //       ),
              //            //OK AND CLEAR BUTTONS
              // Container(
              //   decoration: const BoxDecoration(color: Colors.white30),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     mainAxisSize: MainAxisSize.max,
              //     children: <Widget>[
            
              //       IconButton(
              //         icon: const Icon(Icons.clear),
              //         color: Colors.red,
              //         onPressed: () {
              //           setState(() => _controller.clear());
              //         },
              //       ),
              //     ],
              //   ),
              // ),

                    Center(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        textColor: Colors.white,
                        color: Color(0xff29487d),
                        child: Text(
                          'Submit',
                          style: TextStyle(fontSize: 16),
                        ),
                        onPressed: () async{
                          //    if (_controller.isNotEmpty) {
                          //  data = await _controller.toPngBytes();
                          //    // print(data);
                          //  }
                         //  upload();
                        addCustomer();
                         Navigator.push(
                             context,
                               MaterialPageRoute(
                            builder: (context) => GetReceipts()));
                        }
                        //add,
                      ),
                    ),
                  ]),
                ))));
    
  }
  void addCustomer ( 
  )async{

var map = new Map<String, dynamic>();
map['item_name'] = itemnameController[index].text;
map['item_quantity'] = quantityController[index].text;
map['item_price'] = priceController[index].text;
map['subtotal'] = subtotalController.text;
map['discount'] = discountController.text;
map['shipping'] = shippingController.text;
map['tax'] =   taxController.text;
map['grand_total'] = grandtotalController.text;
map['paid'] = paidController.text;
map['balance_due'] = balancedueController.text;
map['payment_details'] = paymentdetailsController.text;
map['notes'] = notesController.text;
map['created_by'] = createdbyController.text;
map['customer_id'] = selectedValue;
map['customer_sign']= signController.text;


  String url = 'https://dashboard.univest.com.sa/public/api/addreceipt';
  http.post(url,
    headers: {'Accept': 'Application/json'},
          body: map
     ).then((response){
     if(response.statusCode==200){
       print(
         'data save'
       );
       print(response.statusCode);
      
     }else{
       print('data not save');
     }
     });
 
  }
 //------------------------------------------------------ DropDown list Function-------------------------------------------------- 
    var selectedValue;
  //  List data = List();
  List<UserDetails> usersForDisplay = List<UserDetails>();
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

   





