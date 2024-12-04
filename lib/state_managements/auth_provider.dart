import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  String _saveEmail = "";
  String get savedEmail => _saveEmail;

  bool get isLoggedIn => _isLoggedIn;

  AuthProvider() {
    loadAuth();
  }

  void loadAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    print("loadAuth: $_isLoggedIn");
    notifyListeners();
  }

  void setAuth(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = status;
    await prefs.setBool("isLoggedIn", status);
    notifyListeners();
  }

  void saveEmailUser(String email){
    _saveEmail = email;
    notifyListeners();
  }

  // void logout() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _isLoggedIn = false;
  //   await prefs.setBool("isLoggedIn", false);
  //   notifyListeners();
  // }
}
