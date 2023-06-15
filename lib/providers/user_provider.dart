// ignore_for_file: avoid_setters_without_getters

import 'package:flutter/material.dart';

class UserDetail with ChangeNotifier {
  String? id;
  String? role;

  String? get userId => id;

  set setUserId(String value) {
    id = value;
    notifyListeners();
  }

  String? get userRole => role;

  set setUserRole(String value) {
    role = value;
    notifyListeners();
  }
}
