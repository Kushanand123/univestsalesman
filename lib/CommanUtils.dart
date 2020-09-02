import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonUtils{
  

static Future<bool> savePref(String key,String value)async{
  debugPrint(">>>>>>>>>>>>>>>>>>>>>>IN CommonUtil file key>>>>>>>>>>>>>>>>>>>$key");
  debugPrint(">>>>>>value>>>>>>>>$value"); 
   SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.setString(key,value);
}

 static Future<String> fetchPref(String key)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
   return await pref.get(key);
 }


}