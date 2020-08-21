import 'dart:io';
import 'package:flutter/material.dart';
import 'package:univestsalesman/Receipt%20Folder/EditReceipt.dart';
import 'ReceiptList.dart';

class Receipt extends StatefulWidget {
   UserReceipts itemholder;
 Receipt({Key key, @required this.itemholder}) : super(key: key);
  @override
  _ReceiptState createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff29487d)),
        backgroundColor: Colors.white,
        elevation: 1.5,
        title: Text(
          'Receipt Details',
          style: TextStyle(
            color: Color(0xff29487d),
          ),
        ),
      ),
      body: SafeArea(
          child: Container(
     width: MediaQuery.of(context).size.width,
              child: Padding(
        padding: EdgeInsets.all(5),
        child: ListView(
          children: <Widget>[
                    Container(
                    
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: Card(
                        color: Colors.blue[50],
                        elevation: 3,
                         child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.person,
                                    size: 30,
                                    color: Color(0xff29487d),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Container(
                                      child: Text(
                                 'Customer Name',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,    color: Color(0xff29487d),),
                                  )),
                                ],
                              )),
                              Container(
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                        color: Color(0xff29487d),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditReceipt(
                                                      dataholder:  widget.itemholder
                                                    )));
                                      })),
                            ]),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Final Amount', style: TextStyle(fontSize: 18),),
                        Text(  widget.itemholder.grandtotal,
                        style: TextStyle(fontSize: 18),)
                      ],
                      ),
                      ),
                    
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.black26,
                    ),
                   
                   
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal', style: TextStyle(fontSize: 18),),
                        Text(  widget.itemholder.subtotal,
                        style: TextStyle(fontSize: 18),)
                      ],
                      ),
                      ),
                    
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.black26,
                    ),

                  
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Discount', style: TextStyle(fontSize: 18),),
                        Text(  widget.itemholder.discount,
                        style: TextStyle(fontSize: 18),)
                      ],
                      ),
                      ),
                    
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.black26,
                    ),

                   
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Shipping', style: TextStyle(fontSize: 18),),
                        Text(  widget.itemholder.shipping,
                        style: TextStyle(fontSize: 18),)
                      ],
                      ),
                      ),
                    
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.black26,
                    ),

                     
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tax', style: TextStyle(fontSize: 18),),
                        Text(  widget.itemholder.tax,
                        style: TextStyle(fontSize: 18),)
                      ],
                      ),
                      ),
                    
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.black26,
                    ),

                    
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Paid', style: TextStyle(fontSize: 18),),
                        Text(  widget.itemholder.paid,
                        style: TextStyle(fontSize: 18),)
                      ],
                      ),
                      ),
                    
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.black26,
                    ),


                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Balance Due', style: TextStyle(fontSize: 18),),
                        Text( '0',
                        style: TextStyle(fontSize: 18),)
                      ],
                      ),
                      ),
                    
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.black26,
                    ),


                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Payment Details', style: TextStyle(fontSize: 18),),
                        Text(  widget.itemholder.paymentdetails,
                        style: TextStyle(fontSize: 18),)
                      ],
                      ),
                      ),
                    
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.black26,
                    ),


                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Notes', style: TextStyle(fontSize: 18),),
                        Text(  widget.itemholder.notes,
                        style: TextStyle(fontSize: 18),)
                      ],
                      ),
                      ),
                    
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.black26,
                    ),


                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Customer Sign', style: TextStyle(fontSize: 18),),
                        Text(  widget.itemholder.customersign,
                        style: TextStyle(fontSize: 18),)
                      ],
                      ),
                      ),
                    
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.black26,
                    ),

                 
                  ],
                ),
              ),
            ),
     
        ),
      );
   
  }
}





