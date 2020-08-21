import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dropdownfield/dropdownfield.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:toast/toast.dart';
import 'CustomerList.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
class BasicDetails extends StatefulWidget {
  final UserDetails dataholder;
 
   BasicDetails({Key key, @required this.dataholder }) : super(key: key);

  @override
  _BasicDetailsState createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {
  TextEditingController emailController = TextEditingController();
 TextEditingController nameController = TextEditingController();
 TextEditingController mobileController = TextEditingController();
 TextEditingController altmobileController = TextEditingController();
TextEditingController countryController = TextEditingController();
TextEditingController addressController = TextEditingController();
TextEditingController postalcodeController = TextEditingController();
 TextEditingController stateController = TextEditingController();
TextEditingController cityController = TextEditingController();
TextEditingController remarksController = TextEditingController();

  String hint_text = 'Saudi Arabia';
    File _selectedFile;
    

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
  
  final citySelected = TextEditingController();
  String selectCity = '';
    final countrySelected = TextEditingController();
  String selectCountry = '';
    final regionSelected = TextEditingController();
  String selectRegion = '';

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
      backgroundColor: Colors.white,
           iconTheme: IconThemeData(
       color: Color(0xff29487d)
  ),
      title: Text('Basic Details',style: TextStyle(   color: Color(0xff29487d)),)
    ),
        body: SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: <Widget>[
            SizedBox(
                  height: 20,
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
                             widget.dataholder.profilePic
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
                  height: 20,
                ),
                Container(
                    child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  textColor: Colors.white,
                  color: Color(0xff29487d),
                  child: Text(
                    'Add Photo',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            
                              content: Container(
                                color: Colors.white,
                                height: 150,
                                width: 100,
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
                                                    Navigator.pop(context, true);
                                                getPic(ImageSource.camera);
                                              },
                                              child: Text(
                                                'Camera',
                                                style: TextStyle(fontSize: 20),
                                              )),
                                           
                                              ),
                                      ListTile(
                                          leading: Icon(Icons.camera_enhance),
                                          title: FlatButton(
                                              onPressed: () {
                                                    Navigator.pop(context, true);
                                                getPic(ImageSource.gallery);
                                              },
                                              child: Text(
                                                'Gallery',
                                                style: TextStyle(fontSize: 20),
                                              )),
                                          
                                              ),
                                    ],
                                  ),
                                ),
                              );
                        });
                  },
                )),
              ]),
            ),
            
          Container(
            // color: Colors.white,
            child: Container(
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                         controller: nameController,
                          decoration: InputDecoration(
                            // labelText: 'Name',
                            hintText:widget.dataholder.name,
                            hintStyle: TextStyle(fontSize: 22)
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                            controller: emailController,
                          decoration: InputDecoration(
                          //  labelText: 'Email Id',
                             hintText: widget.dataholder.email,
                            hintStyle: TextStyle(fontSize: 22)
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                            controller: mobileController,
                          decoration: InputDecoration(
                          //  labelText: 'Mobile Number',
                             hintText: widget.dataholder.mobile,
                            hintStyle: TextStyle(fontSize: 22)
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                            controller: altmobileController,
                          decoration: InputDecoration(
                          //  labelText: 'Alt Mobile',
                             hintText: widget.dataholder.altmobile,
                            hintStyle: TextStyle(fontSize: 22)
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                        controller: addressController,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: 22)
                          ),
                        ),
                      ),
                        //  Container(
                        //       padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        //       child: TextFormField(
                        //         decoration: InputDecoration(
                        //           hintText: widget.dataholder.postalcode,
                        //         ),
                        //         controller: postalcodeController,
                        //         validator: (value) {
                        //           if (value.isEmpty) {
                        //             return 'Postal Code cannot be empty';
                        //           }
                        //           return null;
                        //         },
                        //       ),
                        //     ),
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
                      hintText: widget.dataholder.state,
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
                    hintText: widget.dataholder.city,
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
                            controller: remarksController,
                          decoration: InputDecoration(
                          //  labelText: 'Remarks',
                             hintText: widget.dataholder.remarks,
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
                              upload();
                            },
                   
                    
                  )),
          
        
        ],
      )),
    ))]))));
  }
//----------------------------------------- upload data --------------------------------------------------------------------------------------------
    Future<String>upload()async{
     
    if (_selectedFile == null) {
      
    //  print(_selectedFile.path);
      /*---------------------------------------------------------------------------*/

      final mimeTypeData =
      lookupMimeType(widget.dataholder.profilePic, headerBytes: [0xFF, 0xD8])
          .split('/');

      // Intilize the multipart request
      final imageUploadRequest = http.MultipartRequest(
          'POST', Uri.parse("https://dashboard.univest.com.sa/public/api/updatecustomer"));

      // Attach the file in the request
      final file =  http.MultipartFile.fromString(
          'profile_pic',widget.dataholder.profilePic,
          contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));

      imageUploadRequest.fields['ext'] = mimeTypeData[1];

     imageUploadRequest.files.add(file);
 //      add param which will upload with images
      imageUploadRequest.fields['name'] = nameController.text == null ? widget.dataholder.name : nameController.text;
      imageUploadRequest.fields['email'] =  emailController.text == null ? widget.dataholder.email : emailController.text;
      imageUploadRequest.fields['mobile'] = mobileController.text == null ? widget.dataholder.mobile : mobileController.text;
      imageUploadRequest.fields['alt_mobile'] = altmobileController.text == null ? widget.dataholder. altmobile :  altmobileController.text;
      imageUploadRequest.fields['address'] = addressController.text == null ? widget.dataholder.address : addressController.text;
      imageUploadRequest.fields['country'] = hint_text;
      imageUploadRequest.fields['state'] = regionSelected == null ? widget.dataholder.state : selectRegion ;
      imageUploadRequest.fields['city'] = citySelected == null ? widget.dataholder.city : selectCity ;
      imageUploadRequest.fields['remarks'] = remarksController.text == null ? widget.dataholder.remarks : remarksController.text;
       imageUploadRequest.fields['id']  =   widget.dataholder.id.toString();
       imageUploadRequest.fields['status'] =  widget.dataholder.status;
    
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
       final mimeTypeData =
      lookupMimeType( _selectedFile.path, headerBytes: [0xFF, 0xD8])
          .split('/');

      // Intilize the multipart request
      final imageUploadRequest = http.MultipartRequest(
          'POST', Uri.parse("https://dashboard.univest.com.sa/public/api/updatecustomer"));

      // Attach the file in the request
      final file = await http.MultipartFile.fromPath(
          'profile_pic',_selectedFile.path,
          contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));

      imageUploadRequest.fields['ext'] = mimeTypeData[1];

     imageUploadRequest.files.add(file);
 //      add param which will upload with images
      imageUploadRequest.fields['name'] = nameController.text == null ? widget.dataholder.name : nameController.text;
      imageUploadRequest.fields['email'] =  widget.dataholder.email;
      imageUploadRequest.fields['mobile'] =  widget.dataholder. mobile;
      imageUploadRequest.fields['alt_mobile'] =  widget.dataholder.altmobile;
      imageUploadRequest.fields['address'] = widget.dataholder.address;
      imageUploadRequest.fields['country'] = hint_text;
      imageUploadRequest.fields['state'] =  widget.dataholder.state;
      imageUploadRequest.fields['city'] = widget.dataholder.city;
      imageUploadRequest.fields['remarks'] =  widget.dataholder.remarks;
       imageUploadRequest.fields['id'] =  widget.dataholder.id.toString();
       imageUploadRequest.fields['status'] =  widget.dataholder.status;
    
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
      // Toast.show("Please select profile photo", context,
      //     duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
    }
  }
//--------------------------------------------------------add Customer----------------------------------------------------------------------------
  
    
}