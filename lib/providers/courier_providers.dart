import 'package:flutter/material.dart';

class ChangePasswordVisibilityAddCourierProvider extends ChangeNotifier {
  bool _visibility = true;

  bool get getVisibility => _visibility;

  void setVisibility() {
    _visibility = !_visibility;
    notifyListeners();
  }
}

class ChangeRePasswordVisibilityAddCourierProvider extends ChangeNotifier {
  bool _visibility = true;

  bool get getVisibility => _visibility;

  void setVisibility() {
    _visibility = !_visibility;
    notifyListeners();
  }
}

class EditCourierChangeNameReadyOnlyProvider extends ChangeNotifier {
  bool _readyOnly = true;

  bool get getVisibility => _readyOnly;

  void setVisibility() {
    _readyOnly = !_readyOnly;
    notifyListeners();
  }
}

class EditCourierChangeEmailReadyOnlyProvider extends ChangeNotifier {
  bool _readyOnly = true;

  bool get getVisibility => _readyOnly;

  void setVisibility() {
    _readyOnly = !_readyOnly;
    notifyListeners();
  }
}

class EditCourierChangePhoneReadyOnlyProvider extends ChangeNotifier {
  bool _readyOnly = true;

  bool get getVisibility => _readyOnly;

  void setVisibility() {
    _readyOnly = !_readyOnly;
    notifyListeners();
  }
}
