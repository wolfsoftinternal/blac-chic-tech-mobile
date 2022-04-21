import 'dart:convert';

import 'package:blackchecktech/Screens/Authentication/login/model/LoginModel.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Created by Vrusti Patel

Future setuplocator() async {
  GetIt locator = GetIt.instance;
  var instance = await MySharedPref.getInstance();
  locator.registerSingleton<MySharedPref>(instance);
}

class MySharedPref {
  static MySharedPref? classInstance;
  static SharedPreferences? preferences;

  static Future<MySharedPref> getInstance() async {
    classInstance ??= MySharedPref();
    preferences ??= await SharedPreferences.getInstance();
    return classInstance!;
  }

  Future<void> setString(String key, String content) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Value Set ::::::" + content);
    prefs.setString(key, content);
  }

  Future<void> setBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Value set ::::::" + value.toString());
    prefs.setBool(key, value);
  }

  getStringValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString(key) ?? "";
    print("Value set ::::::" + stringValue);
    return stringValue;
  }

  getBoolValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    bool? boolVal = prefs.getBool(key);
    print("Value get ::::::" + boolVal.toString());
    return boolVal;
  }

  // It clears preference data by unique key name
  Future<void> clearData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  // It clears preference whole data
  Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  // Used to save user's information
  setLoginInModel(LoginModel model, String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Value set model ::::::" + model.data!.id.toString());
    prefs.setString(key, json.encode(model.toJson()));
  }

  // Used to get user's information
  Future<LoginModel?> getLoginInModel(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var myJson = prefs.getString(key);
    if (myJson == null) {
      return null;
    }
    return LoginModel.fromJson(json.decode(myJson));
  }
}
