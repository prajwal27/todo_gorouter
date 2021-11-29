import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_gorouter/utils/constants.dart';

class AuthState extends ChangeNotifier {
  final SharedPreferences prefs;
  bool isAuthenticated = false;

  AuthState(this.prefs) {
    checkIsAuthenticated();
  }

  void updateLoginStatus(bool value) {
    isAuthenticated = value;
    prefs.setBool(authKey, value);
    notifyListeners();
  }

  void checkIsAuthenticated() {
    isAuthenticated = prefs.getBool(authKey) ?? false;
  }
}
