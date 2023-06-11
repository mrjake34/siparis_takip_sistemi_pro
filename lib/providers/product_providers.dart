import 'package:flutter/material.dart';

class EditProductNameEditButtonProvider extends ChangeNotifier {
  bool _editing = false;

  bool get getEditing => _editing;

  void setEditing() {
    _editing = !_editing;
    notifyListeners();
  }
}
class EditProductPriceEditButtonProvider extends ChangeNotifier {
  bool _editing = false;

  bool get getEditing => _editing;

  void setEditing() {
    _editing = !_editing;
    notifyListeners();
  }
}

