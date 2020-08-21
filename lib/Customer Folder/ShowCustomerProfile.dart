import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import 'EditCustomerDetails.dart';
import 'CustomerList.dart';

class EditProfile extends StatefulWidget {
   UserDetails itemholder;
 EditProfile({Key key, @required this.itemholder}) : super(key: key);
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File _selectedFile;
  bool checkedValue = false;
  bool value = true;

void statusChecked(value){
 // setState(() {
     if(widget.itemholder.status != null){
        checkedValue = value;
  }
 // });
 
}
  getPic(ImageSource source) async {
    var image = await ImagePicker().getImage(source: source);
    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
              toolbarColor: Colors.deepOrange,
              toolbarTitle: " Cropper",
              statusBarColor: Colors.deepOrange.shade500,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false,
              backgroundColor: Colors.white));
      this.setState(() {
        _selectedFile = cropped;
        // _inProcess = false;
      });
    } else {
      this.setState(() {
        // _inProcess = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff29487d)),
        backgroundColor: Colors.white,
        elevation: 1.5,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Color(0xff29487d),
          ),
        ),
      ),
      body: SafeArea(
          child: Container(
              child: Padding(
        padding: EdgeInsets.all(5),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Center(
              child: Column(children: <Widget>[
                _selectedFile == null
                    ? Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70),
                          border: Border.all(width: 3, color: Colors.green),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(
                            2,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: Image(
                              image: NetworkImage(
                             widget.itemholder.profilePic
                             //   "https://scontent.fdel1-3.fna.fbcdn.net/v/t1.0-9/28058346_1010090689145130_1937151555751216876_n.jpg?_nc_cat=111&_nc_sid=09cbfe&_nc_ohc=4SgxTtTqwDcAX-WPEnl&_nc_ht=scontent.fdel1-3.fna&oh=77d7a10ce3a861c9bb8e25b4344675ab&oe=5F1EC981"
                               ),
                        
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70),
                          border: Border.all(width: 3, color: Colors.green),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(
                            2,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: Image.file(
                              _selectedFile,
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 30,
                ),
              
              ]),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              height: 1,
              thickness: 3,
              color: Colors.red,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 460,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: Column(
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 350,
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
                                  widget.itemholder.name,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500),
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
                                                  BasicDetails(
                                                    dataholder:  widget.itemholder
                                                  )));
                                    })),
                          ]),
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    Container(
                        //  color:Colors.amber[400],
                        height: 395,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: MediaQuery.of(context).size.width * 0.39,
                                //  color: Colors.blue,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Container(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(),
                                          Text('Email Address'),
                                          Text('Mobile Number'),
                                          Text(
                                            'Alt Mobile',
                                            textAlign: TextAlign.left,
                                          ),
                                          Text('Country'),
                                          Text('State'),
                                          Text('City'),
                                          Text('Address'),
                                          Text('Remarks'),
                                          Text('Status'),
                                        ]),
                                  ),
                                )),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                //   color: Colors.cyan,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Container(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                    widget.itemholder.email,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                         widget.itemholder.mobile,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                            widget.itemholder.altmobile,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                            widget.itemholder.country,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                         widget.itemholder.state,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                        widget.itemholder.city,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text('Address',
                                       //  widget.itemholder.address,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                      widget.itemholder.remarks,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                       Container(
                                         
                                         child: Checkbox(value: widget.itemholder.status != null ? checkedValue = true : checkedValue = false,
                                         
                                          onChanged: statusChecked
                                          ),
                                       )
                                          // Text(
                                          //  widget.itemholder.status,
                                          //   style: TextStyle(fontSize: 12),
                                          // ),
                                        ]),
                                  ),
                                ))
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ))),
    );
  }

  //  void addCustomer ( 
  // )async{

// var map = new Map<String, dynamic>();
// map['item_name'] = itemnameController[index].text;
// map['item_quantity'] = quantityController[index].text;
// map['item_price'] = priceController[index].text;
// map['subtotal'] = subtotalController.text;
// map['discount'] = discountController.text;
// map['shipping'] = shippingController.text;
// map['tax'] =   taxController.text;
// map['grand_total'] = grandtotalController.text;
// map['paid'] = paidController.text;
// map['balance_due'] = balancedueController.text;
// map['payment_details'] = paymentdetailsController.text;
// map['notes'] = notesController.text;
// map['created_by'] = createdbyController.text;
// map['customer_id'] = customeridController.text;
// map['customer_sign']= signController.text;


//   String url = 'https://dashboard.univest.com.sa/public/api/addreceipt';
//   http.post(url,
//     headers: {'Accept': 'Application/json'},
//           body: map
//      ).then((response){
//      if(response.statusCode==200){
//        print(
//          'data save'
//        );
//        print(response.statusCode);
      
//      }else{
//        print('data not save');
//      }
//      });
 
//   }

}
