import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth_Provider with ChangeNotifier {

  bool isLoggedInValue = false;
  bool get isLogged => isLoggedInValue;

  Future<void> checkLoginStats() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedInValue = prefs.getBool('isLogged') ?? false;
    notifyListeners();
  }

  Future<void> login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogged', true);
    isLoggedInValue = true;
    notifyListeners();
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogged', false);
    isLoggedInValue = false;
    notifyListeners();
  }

}