import 'package:flutter/material.dart';

import 'ReceiptList.dart';

class EditReceipt extends StatefulWidget {

    final UserReceipts dataholder;
 
   EditReceipt({Key key, @required this.dataholder }) : super(key: key);
  @override
  _EditReceiptState createState() => _EditReceiptState();
}

class _EditReceiptState extends State<EditReceipt> {

   TextEditingController totalController = TextEditingController();
 TextEditingController subtotalController = TextEditingController();
 TextEditingController discountController = TextEditingController();
 TextEditingController shippingController = TextEditingController();
TextEditingController taxController = TextEditingController();
TextEditingController paidController = TextEditingController();
TextEditingController balancedueController = TextEditingController();
 TextEditingController paymentdetailsController = TextEditingController();
TextEditingController notesController = TextEditingController();
TextEditingController customernameController = TextEditingController();
TextEditingController customersignController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
      backgroundColor: Colors.white,
           iconTheme: IconThemeData(
       color: Color(0xff29487d)
  ),
      title: Text('Edit Receipt',style: TextStyle(   color: Color(0xff29487d)),)
    ),
    body: SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
      child: Padding(padding: EdgeInsets.all(5),
      child: ListView(
        children: [
         SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(
              left: 10, right: 10
            ),
            child: Text('Customer Name', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            
            ),
          ),
         
           Container(
             padding: EdgeInsets.all(10),
               child: TextFormField(
             controller:  customernameController,
             decoration: InputDecoration(
             // labelText: 'Name',
        hintText:' Customer Name',
  hintStyle: TextStyle(fontSize: 18)
                          ),
                        ),
                      ),
        Container(
            padding: EdgeInsets.only(
              left: 10, right: 10
            ),
            child: Text('Final Amount', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            
            ),
          ),
                 Container(
             padding: EdgeInsets.all(10),
               child: TextFormField(
             controller: totalController,
             decoration: InputDecoration(
             // labelText: 'Name',
        hintText:widget.dataholder.grandtotal,
     hintStyle: TextStyle(fontSize: 22)
                          ),
                        ),
                      ),
  Container(
            padding: EdgeInsets.only(
              left: 10, right: 10
            ),
            child: Text('Subtotal', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            
            ),
          ),
             Container(
             padding: EdgeInsets.all(10),
               child: TextFormField(
             controller: subtotalController,
             decoration: InputDecoration(
             // labelText: 'Name',
        hintText:widget.dataholder.subtotal,
  hintStyle: TextStyle(fontSize: 22)
                          ),
                        ),
                      ),
           Container(
            padding: EdgeInsets.only(
              left: 10, right: 10
            ),
            child: Text('Discount', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            
            ),
          ),
                         Container(
             padding: EdgeInsets.all(10),
               child: TextFormField(
             controller: discountController,
             decoration: InputDecoration(
             // labelText: 'Name',
        hintText:widget.dataholder.discount,
  hintStyle: TextStyle(fontSize: 22)
                          ),
                        ),
                      ),
   Container(
            padding: EdgeInsets.only(
              left: 10, right: 10
            ),
            child: Text('Shipping', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            
            ),
          ),
    Container(
             padding: EdgeInsets.all(10),
               child: TextFormField(
             controller: shippingController,
             decoration: InputDecoration(
             // labelText: 'Name',
        hintText:widget.dataholder.shipping,
  hintStyle: TextStyle(fontSize: 22)
                          ),
                        ),
                      ),
  Container(
            padding: EdgeInsets.only(
              left: 10, right: 10
            ),
            child: Text('Tax', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            
            ),
          ),

                Container(
             padding: EdgeInsets.all(10),
               child: TextFormField(
             controller: taxController,
             decoration: InputDecoration(
             // labelText: 'Name',
        hintText:widget.dataholder.tax,
  hintStyle: TextStyle(fontSize: 22)
                          ),
                        ),
                      ), 
  Container(
            padding: EdgeInsets.only(
              left: 10, right: 10
            ),
            child: Text('Paid', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            
            ),
          ),
                      
               Container(
             padding: EdgeInsets.all(10),
               child: TextFormField(
             controller: paidController,
             decoration: InputDecoration(
             // labelText: 'Name',
        hintText:widget.dataholder.paid,
  hintStyle: TextStyle(fontSize: 22)
                          ),
                        ),
                      ),

          Container(
            padding: EdgeInsets.only(
              left: 10, right: 10
            ),
            child: Text('Balance Due', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            
            ),
          ),

                Container(
             padding: EdgeInsets.all(10),
               child: TextFormField(
             controller: balancedueController,
             decoration: InputDecoration(
             // labelText: 'Name',
        hintText:widget.dataholder.balancedue,
  hintStyle: TextStyle(fontSize: 22)
                          ),
                        ),
                      ),

        Container(
            padding: EdgeInsets.only(
              left: 10, right: 10
            ),
            child: Text('Payment Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            
            ),
          ),

                         Container(
             padding: EdgeInsets.all(10),
               child: TextFormField(
             controller: paymentdetailsController,
             decoration: InputDecoration(
             // labelText: 'Name',
        hintText:widget.dataholder.paymentdetails,
  hintStyle: TextStyle(fontSize: 22)
                          ),
                        ),
                      ),
  Container(
            padding: EdgeInsets.only(
              left: 10, right: 10
            ),
            child: Text('Notes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            
            ),
          ),

                 Container(
             padding: EdgeInsets.all(10),
               child: TextFormField(
             controller: notesController,
             decoration: InputDecoration(
             // labelText: 'Name',
        hintText:widget.dataholder.notes,
  hintStyle: TextStyle(fontSize: 22)
                          ),
                        ),
                      ),

      Container(
            padding: EdgeInsets.only(
              left: 10, right: 10
            ),
            child: Text('Customer Sign', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            
            ),
          ),

                  Container(
             padding: EdgeInsets.all(10),
               child: TextFormField(
             controller: customersignController,
             decoration: InputDecoration(
             // labelText: 'Name',
        hintText:widget.dataholder.customersign,
  hintStyle: TextStyle(fontSize: 22)
                          ),
                        ),
                      ),

                    SizedBox(
                        height: 10,
                      ),
                      Container(
                          height: 40,
                          width: 100,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3))),
                            textColor: Colors.white,
                            color: Color(0xff29487d),
                            child: Text(
                              'Save',
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                     
                            },
                   
                    
                  )),
        ],
      )
      )
      )
      ),
    );
  }
}