import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:toast/toast.dart';
import 'package:dropdownfield/dropdownfield.dart';


import 'CustomerList.dart';



class Create extends StatefulWidget {
    String dataitem;
   Create({Key key, @required this.dataitem}) : super(key: key);
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {

   File _selectedFile;
   String state;
 TextEditingController emailController = TextEditingController();
 TextEditingController nameController = TextEditingController();
 TextEditingController mobileController = TextEditingController();
 TextEditingController altmobileController = TextEditingController();
TextEditingController countryController = TextEditingController();
 TextEditingController stateController = TextEditingController();
TextEditingController cityController = TextEditingController();
TextEditingController addressController = TextEditingController();
TextEditingController postalcodeController = TextEditingController();
 TextEditingController remarksController = TextEditingController();

   final formkey = GlobalKey<FormState>();
  
//----------------------------------------Dropdown list Items---------------------------------------------------------------------------------------

  List<String> countries = [
    'South Arabia',
    'India',
    'England',
    'USA',
    'Australia',
    'China'

  ];

    List<String> regions = [
  'Asir',
  'Bahah',
  'Eastern Province',
  "Ha'il",
  'Jawf',
  'Jizan',
  'Madinah',
  'Makkah',
  'Najran',
  'Quassim'
  ];

  List<String> cities = [
    'Abha',
    'Ad-Dilam',
    'Al-Abwa',
    'Badr',
    'Baljurashi',
    'Bisha',
    'Bareg',

  ];
  String hint_text = 'Saudi Arabia';
  final citySelected = TextEditingController();
  String selectCity = '';
    final countrySelected = TextEditingController();
  String selectCountry = '';
    final regionSelected = TextEditingController();
  String selectRegion = '';

//----------------------------------------------------- Add photo----------------------------------------------------------------------------
  Widget editIcon(BuildContext context) {
    return IconButton(
        iconSize: 30,
        color: Colors.black,
        icon: Icon(Icons.edit),
        onPressed: () {
          showDialog(
            
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                
                    // title: Text(
                    //   "Add Photo",
                    //   style: TextStyle(color: Colors.blue),
                    // ),
                    content: Container(
                     color: Colors.white,
                      height: 130,
                      width: 50,
                    //  child: Card(
                        child: ListView(
                          children: <Widget>[
                            Text('Add photo',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                            SizedBox(
                              height: 10,
                            ),
                            ListTile(
                                leading: Icon(Icons.camera_alt),
                                title: FlatButton(
                                    onPressed: () {

                                      getPic(ImageSource.camera);
                                      Navigator.pop(context, true);
                                    },
                                    child: Text(
                                      ' Camera',
                                      style: TextStyle(fontSize: 17),
                                    ))),
                            ListTile(
                                leading: Icon(Icons.camera_enhance),
                                title: FlatButton(
                                    onPressed: () {
                                      getPic(ImageSource.gallery);
                                       Navigator.pop(context, true);
                                    },
                                    child: Text(
                                      ' Gallery',
                                      style: TextStyle(fontSize: 17),
                                    ))),
                          ],
                        ),
                      ),
                   // )
                    );
              });
        });
  }

// Image crop and image picker------------------------------------------------------------------------------------------------------------------

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
    return
     Scaffold(
      appBar: AppBar(
        elevation: 0.8,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Color(0xff29487d)),
            title: Text("Add Customer",
                style: TextStyle(
                  color: Color(0xff29487d),
                ))),
        body: SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Center(
              child: Stack(children: <Widget>[
            Container(
              height: 140,
              width: 140,
              child: _selectedFile == null
                  ? editIcon(context)
                  // Center(
                  //     child: Text('Upload', style: TextStyle(fontSize: 25)))
                  : Image.file(
                      _selectedFile,
                      fit: BoxFit.cover,
                    ),
              decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(
              color: Color(0xff29487d),
                    width: 3,
                  )),
            ),
          ])),
          SizedBox(
            height: 10,
          ),
          Container(
            // color: Colors.white,
            child: Container(
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Form(
                          key: formkey,
                          child: Column(children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Name',
                                ),
                                controller: nameController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Name cannot be empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Email Id',
                                ),
                                controller: emailController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Email cannot be empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Mobile Number',
                                ),
                                controller: mobileController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Mobile cannot be empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Alt Mobile',
                                ),
                                controller: altmobileController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Alt Mobile cannot be empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Address',
                                ),
                                controller: addressController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Address cannot be empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                              Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Postal Code',
                                ),
                                controller: postalcodeController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Postal Code cannot be empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: Text(hint_text,style: TextStyle(fontSize: 18,  color: Colors.grey[600],)
                            ),),
                            Divider(
                              thickness: 1,
                            indent: 8,
                            endIndent: 10,
                              color: Colors.grey[500],
                            ),
                                 SizedBox(
                                  height: 20,
                                 ),
                         
                    DropDownField(
                    
                      controller : regionSelected,
                      hintText: 'Select Any Region',
                      hintStyle: TextStyle(color: Colors.black),
                      textStyle: TextStyle(fontSize: 18, color: Colors.grey[600]),
                      enabled: true,
                      items: regions,
                      //required: true,
                    //  strict: true,
                      onValueChanged: (value){
                        setState(() {
                          selectRegion = value;
                        });
                      },
                         //   value: selectRegion,
                    ),

                       SizedBox(
                      height: 20,
                    ),
                    DropDownField(
                      controller : citySelected,
                      hintText: 'Select Any City',
                      hintStyle: TextStyle(color: Colors.black),
                      textStyle: TextStyle(fontSize: 18, color: Colors.grey[600]),
                      enabled: true,
                      items: cities,
                   
                      //required: true,
                    //  strict: true,
                      onValueChanged: (value){
                        setState(() {
                          selectCity = value;
                        });
                      },
                       //   value: selectCity,
                    ),
                    
                       SizedBox(
                      height: 5,
                    ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Remarks',
                                ),
                                controller: remarksController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Remarks cannot be empty';
                                  }
                                  return null;
                                },
                              ),
                            )
                           ])),
                      SizedBox(
                        height: 10,
                      ),
   // Add Customer on click the add button------------------------------------------------------------------------------------
                      Container(
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3))),
                              textColor: Colors.white,
                              color: Color(0xff29487d),
                              child: Text(
                                'Submit',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () async {
                                  if (formkey.currentState.validate()) {
                                  upload();}
                             //   addCustomer();
                              },
                           
                              )),
                      SizedBox(
                        height: 5,
                      ),
                   //   Text(message),
                  
                    ],
                  )),
            ),
          ),
        ],
      )),
    ));
  }

  //*------------------------------Upload Image--------------------------------------------------------------------------------------
  Future<String>upload()async{
      
    if (_selectedFile != null) {
      print(_selectedFile.path);
      /*---------------------------------------------------------------------------*/

      final mimeTypeData =
      lookupMimeType(_selectedFile.path, headerBytes: [0xFF, 0xD8])
          .split('/');

      // Intilize the multipart request
      final imageUploadRequest = http.MultipartRequest(
          'POST', Uri.parse("https://dashboard.univest.com.sa/public/api/addcustomer"));

      // Attach the file in the request
      final file = await http.MultipartFile.fromPath(
          'profile_pic', _selectedFile.path,
          contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));

      imageUploadRequest.fields['ext'] = mimeTypeData[1];

     imageUploadRequest.files.add(file);
 //      add param which will upload with images
      imageUploadRequest.fields['name'] = nameController.text;
      imageUploadRequest.fields['email'] = emailController.text;
      imageUploadRequest.fields['mobile'] = mobileController.text;
      imageUploadRequest.fields['alt_mobile'] = altmobileController.text;
      imageUploadRequest.fields['address'] = addressController.text;
      imageUploadRequest.fields['country'] = hint_text;
      imageUploadRequest.fields['state'] = selectRegion;
      imageUploadRequest.fields['city'] = selectRegion;
      imageUploadRequest.fields['remarks'] = remarksController.text;
      imageUploadRequest.fields['created_by'] = widget.dataitem;
      final streamedResponse = await imageUploadRequest.send();

      var response =
      await http.Response.fromStream(streamedResponse);
      print(response.body);
      try {
        var decodedData = json.decode(response.body);

        print(decodedData['code']);
        if (decodedData['code'] == 200) {
          Toast.show(decodedData['success'], context,
              duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
          print('Image uploaded successfully');
          setState(() {
                Navigator.push(
                      context,
                    MaterialPageRoute(
                   builder: (context) => ClientList2()));
          });

        } else {
          Toast.show(decodedData['success'], context,
              duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
        }
      } on Exception {

        Toast.show('server error', context,
            duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);// only executed if error is of type Exception
      } catch (error) {

        Toast.show('serverr error', context,
            duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);// executed for errors of all types other than Exception
      }
 
    } else {
      Toast.show("Please select profile photo", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
    }
  }

//*----------------------------------------------- add customer--------------------------------------------------------------------------------------------
//   void addCustomer ( 
//   )async{

// final uri = 'https://na57.salesforce.com/services/oauth2/token';

// var map = new Map<String, dynamic>();
// map['grant_type'] = 'password';
// map['client_id'] = '3MVG9dZJodJWITSviqdj3EnW.LrZ81MbuGBqgIxxxdD6u7Mru2NOEs8bHFoFyNw_nVKPhlF2EzDbNYI0rphQL';
// map['client_secret'] = '42E131F37E4E05313646E1ED1D3788D76192EBECA7486D15BDDB8408B9726B42';
// map['username'] = 'example@mail.com.us';
// map['password'] = 'ABC1234563Af88jesKxPLVirJRW8wXvj3D';

// http.Response response = await http.post(
//     uri,
//     body: map,
// );
//      String url = 'https://dashboard.univest.com.sa/public/api/addcustomer';
//   http.post(url,
//     headers: {'Accept': 'Application/json'},
//           body: {
//        'email': emailController.text,     
//         'name': nameController.text,       
//         'mobile': mobileController.text,     
//         'alt_mobile': altmobileController.text,
//        'country': hint_text,
//         'state': stateController.text,
//         'city': cityController.text,
//        'address': addressController.text,
//        'postal_code' : postalcodeController.text,
//         'remarks': remarksController.text,
//        //'created_by' : createdbyController.text,
//       // 'created_by' : getuser
//       },
//      ).then((response){
//      if(response.statusCode==200){
//        print(
//          'data save'
//        );
//        print(response.statusCode);
//        setState(() {
//           Navigator.push(context,
//         MaterialPageRoute(builder: (context) => ClientList()));
//        });
//      }else{
//        print('data not save');
//      }
//      });
 
//   }

}



