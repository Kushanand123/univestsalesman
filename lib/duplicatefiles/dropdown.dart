import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:searchable_dropdown/searchable_dropdown.dart';

class ExampleNumber {
  int number;

  static final Map<int, String> map = {
    0: "zero",
    1: "one",
    2: "two",
    3: "three",
    4: "four",
    5: "five",
    6: "six",
    7: "seven",
    8: "eight",
    9: "nine",
    10: "ten",
    11: "eleven",
    12: "twelve",
    13: "thirteen",
    14: "fourteen",
    15: "fifteen",
  };

  String get numberString {
    return (map.containsKey(number) ? map[number] : "unknown");
  }

  ExampleNumber(this.number);

  String toString() {
    return ("$number $numberString");
  }

  static List<ExampleNumber> get list {
    return (map.keys.map((num) {
      return (ExampleNumber(num));
    })).toList();
  }
}

class Dropdown extends StatefulWidget {
  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  bool asTabs = false;
  String selectedValue;
  String preselectedValue = "dolor sit";
  ExampleNumber selectedNumber;
  List<int> selectedItems = [];
  final List<DropdownMenuItem> items = [];

  static const String appTitle = "Search Choices demo";
  final String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  void initState() {
    String wordPair = "";
    loremIpsum
        .toLowerCase()
        .replaceAll(",", "")
        // .replaceAll(".", "")
        .split(" ")
        .forEach((word) {
      if (wordPair.isEmpty) {
        wordPair = word + " ";
      } else {
        wordPair += word;
        if (items.indexWhere((item) {
              return (item.value == wordPair);
            }) ==
            -1) {
          items.add(DropdownMenuItem(
            child: Text(wordPair),
            value: wordPair,
          ));
        }
        wordPair = "";
      }
    });
    super.initState();
  }

  List<Widget> get appBarActions {
    return ([
      Center(child: Text("Tabs:")),
      Switch(
        activeColor: Colors.white,
        value: asTabs,
        onChanged: (value) {
          setState(() {
            asTabs = value;
          });
        },
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Widget> widgets;
    widgets = {
      "Single dialog": SearchableDropdown.single(
        items: items,
        value: selectedValue,
        hint: "Select one",
        searchHint: "Select one",
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        isExpanded: true,
      ),
      "Multi dialog": SearchableDropdown.multiple(
        items: items,
        selectedItems: selectedItems,
        hint: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text("Select any"),
        ),
        searchHint: "Select any",
        onChanged: (value) {
          setState(() {
            selectedItems = value;
          });
        },
        closeButton: (selectedItems) {
          return (selectedItems.isNotEmpty
              ? "Save ${selectedItems.length == 1 ? '"' + items[selectedItems.first].value.toString() + '"' : '(' + selectedItems.length.toString() + ')'}"
              : "Save without selection");
        },
        isExpanded: true,
      ),
      "Single done button dialog": SearchableDropdown.single(
        items: items,
        value: selectedValue,
        hint: "Select one",
        searchHint: "Select one",
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        doneButton: "Done",
        displayItem: (item, selected) {
          return (Row(children: [
            selected
                ? Icon(
                    Icons.radio_button_checked,
                    color: Colors.grey,
                  )
                : Icon(
                    Icons.radio_button_unchecked,
                    color: Colors.grey,
                  ),
            SizedBox(width: 7),
            Expanded(
              child: item,
            ),
          ]));
        },
        isExpanded: true,
      ),
      "Multi custom display dialog": SearchableDropdown.multiple(
        items: items,
        selectedItems: selectedItems,
        hint: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text("Select any"),
        ),
        searchHint: "Select any",
        onChanged: (value) {
          setState(() {
            selectedItems = value;
          });
        },
        displayItem: (item, selected) {
          return (Row(children: [
            selected
                ? Icon(
                    Icons.check,
                    color: Colors.green,
                  )
                : Icon(
                    Icons.check_box_outline_blank,
                    color: Colors.grey,
                  ),
            SizedBox(width: 7),
            Expanded(
              child: item,
            ),
          ]));
        },
        selectedValueWidgetFn: (item) {
          return (Center(
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Colors.brown,
                      width: 0.5,
                    ),
                  ),
                  margin: EdgeInsets.all(12),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(item.toString()),
                  ))));
        },
        doneButton: (selectedItemsDone, doneContext) {
          return (RaisedButton(
              onPressed: () {
                Navigator.pop(doneContext);
                setState(() {});
              },
              child: Text("Save")));
        },
        closeButton: null,
        style: TextStyle(fontStyle: FontStyle.italic),
        searchFn: (String keyword, items) {
          List<int> ret = List<int>();
          if (keyword != null && items != null && keyword.isNotEmpty) {
            keyword.split(" ").forEach((k) {
              int i = 0;
              items.forEach((item) {
                if (k.isNotEmpty &&
                    (item.value
                        .toString()
                        .toLowerCase()
                        .contains(k.toLowerCase()))) {
                  ret.add(i);
                }
                i++;
              });
            });
          }
          if (keyword.isEmpty) {
            ret = Iterable<int>.generate(items.length).toList();
          }
          return (ret);
        },
        clearIcon: Icon(Icons.clear_all),
        icon: Icon(Icons.arrow_drop_down_circle),
        label: "Label for multi",
        underline: Container(
          height: 1.0,
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.teal, width: 3.0))),
        ),
        iconDisabledColor: Colors.brown,
        iconEnabledColor: Colors.indigo,
        isExpanded: true,
      ),
      "Multi select 3 dialog": SearchableDropdown.multiple(
        items: items,
        selectedItems: selectedItems,
        hint: "Select 3 items",
        searchHint: "Select 3",
        validator: (selectedItemsForValidator) {
          if (selectedItemsForValidator.length != 3) {
            return ("Must select 3");
          }
          return (null);
        },
        onChanged: (value) {
          setState(() {
            selectedItems = value;
          });
        },
        doneButton: (selectedItemsDone, doneContext) {
          return (RaisedButton(
              onPressed: selectedItemsDone.length != 3
                  ? null
                  : () {
                      Navigator.pop(doneContext);
                      setState(() {});
                    },
              child: Text("Save")));
        },
        closeButton: (selectedItems) {
          return (selectedItems.length == 3 ? "Ok" : null);
        },
        isExpanded: true,
      ),
      "Single menu": SearchableDropdown.single(
        items: items,
        value: selectedValue,
        hint: "Select one",
        searchHint: null,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        dialogBox: false,
        isExpanded: true,
        menuConstraints: BoxConstraints.tight(Size.fromHeight(350)),
      ),
      "Multi menu": SearchableDropdown.multiple(
        items: items,
        selectedItems: selectedItems,
        hint: "Select any",
        searchHint: "",
        doneButton: "Close",
        closeButton: SizedBox.shrink(),
        onChanged: (value) {
          setState(() {
            selectedItems = value;
          });
        },
        dialogBox: false,
        isExpanded: true,
        menuConstraints: BoxConstraints.tight(Size.fromHeight(350)),
      ),
      "Multi menu select all/none": SearchableDropdown.multiple(
        items: items,
        selectedItems: selectedItems,
        hint: "Select any",
        searchHint: "Select any",
        onChanged: (value) {
          setState(() {
            selectedItems = value;
          });
        },
        dialogBox: false,
        closeButton: (selectedItemsClose) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RaisedButton(
                  onPressed: () {
                    setState(() {
                      selectedItems.clear();
                      selectedItems.addAll(
                          Iterable<int>.generate(items.length).toList());
                    });
                  },
                  child: Text("Select all")),
              RaisedButton(
                  onPressed: () {
                    setState(() {
                      selectedItems.clear();
                    });
                  },
                  child: Text("Select none")),
            ],
          );
        },
        isExpanded: true,
        menuConstraints: BoxConstraints.tight(Size.fromHeight(350)),
      ),
      "Multi dialog select all/none without clear": SearchableDropdown.multiple(
        items: items,
        selectedItems: selectedItems,
        hint: "Select any",
        searchHint: "Select any",
        displayClearIcon: false,
        onChanged: (value) {
          setState(() {
            selectedItems = value;
          });
        },
        dialogBox: true,
        closeButton: (selectedItemsClose) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RaisedButton(
                  onPressed: () {
                    setState(() {
                      selectedItems.clear();
                      selectedItems.addAll(
                          Iterable<int>.generate(items.length).toList());
                    });
                  },
                  child: Text("Select all")),
              RaisedButton(
                  onPressed: () {
                    setState(() {
                      selectedItems.clear();
                    });
                  },
                  child: Text("Select none")),
            ],
          );
        },
        isExpanded: true,
      ),
      "Single dialog custom keyboard": SearchableDropdown.single(
        items: Iterable<int>.generate(20).toList().map((i) {
          return (DropdownMenuItem(
            child: Text(i.toString()),
            value: i.toString(),
          ));
        }).toList(),
        value: selectedValue,
        hint: "Select one number",
        searchHint: "Select one number",
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        dialogBox: true,
        keyboardType: TextInputType.number,
        isExpanded: true,
      ),
      "Single dialog object": SearchableDropdown.single(
        items: ExampleNumber.list.map((exNum) {
          return (DropdownMenuItem(
              child: Text(exNum.numberString), value: exNum));
        }).toList(),
        value: selectedNumber,
        hint: "Select one number",
        searchHint: "Select one number",
        onChanged: (value) {
          setState(() {
            selectedNumber = value;
          });
        },
        dialogBox: true,
        isExpanded: true,
      ),
      "Single dialog overflow": SearchableDropdown.single(
        items: [
          DropdownMenuItem(
            child: Text(
                "way too long text for a smartphone at least one that goes in a normal sized pair of trousers but maybe not for a gigantic screen like there is one at my cousin's home in a very remote country where I wouldn't want to go right now"),
            value:
                "way too long text for a smartphone at least one that goes in a normal sized pair of trousers but maybe not for a gigantic screen like there is one at my cousin's home in a very remote country where I wouldn't want to go right now",
          )
        ],
        value: "",
        hint: "Select one",
        searchHint: "Select one",
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        dialogBox: true,
        isExpanded: true,
      ),
      "Single dialog readOnly": SearchableDropdown.single(
        items: [
          DropdownMenuItem(
            child: Text("one item"),
            value: "one item",
          )
        ],
        value: "one item",
        hint: "Select one",
        searchHint: "Select one",
        disabledHint: "Disabled",
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        dialogBox: true,
        isExpanded: true,
        readOnly: true,
      ),
      "Single dialog disabled": SearchableDropdown.single(
        items: [
          DropdownMenuItem(
            child: Text("one item"),
            value: "one item",
          )
        ],
        value: "one item",
        hint: "Select one",
        searchHint: "Select one",
        disabledHint: "Disabled",
        onChanged: null,
        dialogBox: true,
        isExpanded: true,
      ),
      "Historical example": SearchableDropdown(
        items: items,
        value: selectedValue,
        hint: Text('Select One'),
        searchHint: new Text(
          'Select One',
          style: new TextStyle(fontSize: 20),
        ),
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        isExpanded: true,
      ),
      "Update value from outside the plugin": Column(
        children: [
          SearchableDropdown(
            items: items,
            value: selectedValue,
            hint: Text('Select One'),
            searchHint: new Text(
              'Select One',
              style: new TextStyle(fontSize: 20),
            ),
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            isExpanded: true,
          ),
          FlatButton(
            child: Text("Select $preselectedValue"),
            onPressed: () {
              setState(() {
                selectedValue = preselectedValue;
              });
            },
          ),
        ],
      ),
    };

    return MaterialApp(
      home: asTabs
          ? DefaultTabController(
              length: widgets.length,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text(appTitle),
                  actions: appBarActions,
                  bottom: TabBar(
                    isScrollable: true,
                    tabs: Iterable<int>.generate(widgets.length)
                        .toList()
                        .map((i) {
                      return (Tab(
                        text: (i + 1).toString(),
                      ));
                    }).toList(), //widgets.keys.toList().map((k){return(Tab(text: k));}).toList(),
                  ),
                ),
                body: Container(
                  padding: EdgeInsets.all(20),
                  child: TabBarView(
                    children: widgets
                        .map((k, v) {
                          return (MapEntry(
                              k,
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(children: [
                                  Text(k),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  v,
                                ]),
                              )));
                        })
                        .values
                        .toList(),
                  ),
                ),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                title: const Text(appTitle),
                actions: appBarActions,
              ),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: widgets
                      .map((k, v) {
                        return (MapEntry(
                            k,
                            Center(
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                    margin: EdgeInsets.all(20),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        children: <Widget>[
                                          Text("$k:"),
                                          v,
                                        ],
                                      ),
                                    )))));
                      })
                      .values
                      .toList(),
                ),
              ),
            ),
    );
  }
}










//     import 'package:flutter/material.dart';
// // import 'package:foodfromforeign1/models/country.dart';
// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:flutter_typeahead/flutter_typeahead.dart';

// class Dropdown extends StatefulWidget {
 

//   @override
//   _DropdownState createState() =>  _DropdownState();
// }

// class _DropdownState extends State<Dropdown> {
//     List<String> cities = [
//     'Abha',
//     'Ad-Dilam',
//     'Al-Abwa',
//     'Badr',
//     'Baljurashi',
//     'Bisha',
//     'Bareg',

//   ];
//  //final String url = "http://10.0.2.2/fff/api/allcountries/";
//  String _mystate;
//       List data = List();
// final String url = 'https://dashboard.univest.com.sa/public/api/getcustomers';

//       Future getCustomerName() async {

//         var res = await http.get(url, headers: {"Accept": "application/json"});
//         var resBody = json.decode(res.body)['success'];
     
//         setState(() {
//           print('-----------------------------------------------');
//           print(resBody);
//           data = resBody;
//         });
//         return 'Success';
//       }

//        @override
//   void initState() {
//     super.initState();
//    getCustomerName();
//   }
// // List data = List(); //line
// // Future<String> getData() async {
// //     var res = await http.get(url, headers: {"Accept": "application/json"});
// //     var resBody = json.decode(res.body)['success'];
// //     var string = json.encode(resBody);

// //     setState(() {

// //      data = resBody;
// //       print(data.runtimeType);
// //       print(data);
// //     });

// //     return "Sucess";
// //   }

// //     @override
// //   void initState() {
// //     this.getData();
// //     super.initState();
// //   }

// @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar:  AppBar(
//         title:  Text('DropDown'),
//       ),
//       body:Container(
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//         child:Column(
//          children: <Widget>[
//          DropdownButtonHideUnderline(
//                   // child: ButtonTheme(
//                   // alignedDropdown: false,
//                   child: DropdownButton<String>(
                 
//                     // iconSize: 30,
//                     // icon: (null),
//                     // style: TextStyle(
//                     //   color: Colors.black54,
//                     //   fontSize: 16
//                     // ),
//                     hint: Text('Customer Name Select'),
//                      items: data.map(
//         (val) {
//           return DropdownMenuItem<String>(
//             value: val['name'],
//             child: Text(val['name']),
//           );
//         },
//       ).toList(),
//       onChanged: (val) {
//         setState(
//           () {
//             _mystate = val;
//           },
//         );
//       },
                
//                   //   items: data.map(( item){
//                   //     return DropdownMenuItem(
//                   //       child: Text(item['name']),
//                   //       value: item['name'],
//                   //       );
//                   //   }).toList(),

//                   //      value: _mystate,
//                   //        onChanged: ( newValue){
//                   //   setState(() {
//                   //     _mystate = newValue;
//                   //    getCustomerName ();
//                   //     print(_mystate);
//                   //   });
//                   // },
//                     )
//                   )
//                  // ),
//     //        TypeAheadField(
//     //   onSuggestionSelected: (data) => print('selected: ${data['name']} '),
//     //   suggestionsCallback: (s) => data.where((c) => c['name'].toLowerCase().contains(s.toLowerCase())),
//     //   itemBuilder: (ctx, data) => Text(data.name, textScaleFactor: 2,),
//     // )
//          ],

//         )




//       ),
//     );

//   }
// }



// import 'package:flutter/material.dart';
// import 'package:dropdownfield/dropdownfield.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Dropdown extends StatefulWidget {
//   @override
//   _DropdownState createState() => _DropdownState();
// }

// class _DropdownState extends State<Dropdown> {
// //List data;

// List userData;
//   final customerNameSelect = TextEditingController();
//   String selectCustomerName = '';

// // Future<List> fetchUsers() async{
// //  String url =   "https://dashboard.univest.com.sa/public/api/getcustomers";
// //  http.Response response = await http.get(url,
// //    headers: {'Accept': 'Application/json'},
// //  );
// // data = json.decode(response.body)['name']['success'];
// // print('My name list is $data');
// // return userData;
// // }

// //Exception
//  //Unhandled Exception: type 'String' is not a subtype of type 'int' of 'index'
// @override
// void initState() {
  
//     super.initState();
//     locaData();
//   }
//   List<userDetails> arr  = [];
//   final String apiUrl =
//       "https://dashboard.univest.com.sa/public/api/getcustomers";
  
//   locaData() async {
//     var response = await http.get(apiUrl, headers: {'Accept':'application/json'} );
//     if(response.statusCode == 200){

//    var jsonBody = json.decode(response.body)['success'];
//  // var listString = json.encode(jsonBody);
//     print(jsonBody.runtimeType);
//   print(jsonBody);

//   // print(listString.runtimeType);
//   // print(listString);
// // List<String> stringList = jsonBody.cast<String>();
// // print(stringList);
// //   List<dynamic> stringList = jsonDecode(jsonBody);
  
  
//    for(var data in jsonBody){
//   //   arr = data['success']['name'];
//      arr.add(  userDetails
      
//      (
//     name: data['name']
//      ));}
  
//      setState(() {
//        print(arr.runtimeType);
//        arr.forEach((element) {
      
//       print('Name: ${element.name}');
  
//         });
// //print('Name : ${arr.toString()}');
       
//      });
//      }
   
//     else{
//       print('Something is wrong');
//     }
//   }
// //   Future<UserDetails> fetchUsers() async {
// //     var result = await http.get(apiUrl);
// //  var response   = json.encode(result.body);
// // // print(response.runtimeType );
// // // print(response);
// // var name = json.decode(response);
// // // print(name.runtimeType );
// // // print(name);
// // List arr = name['success']['name'];
// // print('Name : $arr');
// //   }
// //   String _name(dynamic user) {
// //     return user['name'];
// //   }
// //     final customerSelected = TextEditingController();
// //   String selectCustomer = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//       child: Container(
//         child: Center(
//           //  child: FutureBuilder<List<dynamic>>(
//           //       future: fetchUsers(),
//           //       builder: (BuildContext context, AsyncSnapshot snapshot) {
//           //         if (snapshot.hasData) {
//           //           //  print(_age(snapshot.data[0]));
//           //           return
//                   child:        DropDownField(
//                       controller : customerNameSelect,
//                     hintText: 'Customer name',
//                       hintStyle: TextStyle(color: Colors.black),
//                       textStyle: TextStyle(fontSize: 18, color: Colors.grey[600]),
//                       enabled: true,
//                       items: arr,
                  
                  
                   
//                       //required: true,
//                     //  strict: true,
//                       onValueChanged: (value){
//                         setState(() {
//                           selectCustomerName = value;
//                         });
//                       },
//                        //   value: selectCity,
//                     )
//                     //}}
//                     )
//         )
//       ),
//     );
//   }
// }

// class userDetails {
 
//   final String name ;


//   userDetails({ this.name, });

//   factory userDetails.fromJson(Map<String, dynamic> json) {
//     return new userDetails(
 
//       name: json['name'],

//     );
//   }
// }