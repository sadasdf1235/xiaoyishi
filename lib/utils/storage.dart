import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
class Storage{
  static setStringData(String key,String value) async{
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }
  static getStringData(String key) async{
    try{
      var prefs = await SharedPreferences.getInstance();
      return json.decode(prefs.getString(key)!);
    }catch(e){
      print(e);
    }
  }
  static removeData(String key) async{
    var prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
  static setIntData(String key,int value) async{
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }
  static getIntData(String key) async{
    var prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }
  static setMapData(String key,Map<String,dynamic> value) async{
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }
  static getMapData(String key) async{
    var prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key)!);
  }
  static clear() async{
    var prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}