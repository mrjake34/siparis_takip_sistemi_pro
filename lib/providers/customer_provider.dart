import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomerMapProvider with ChangeNotifier {
  LatLng _latLng = const LatLng(37.42796133580664, -122.085749655962);

  LatLng get coordinates {
    return _latLng;
  }

  set coordinates(LatLng value) {
    _latLng = value;
    notifyListeners();
  }
}

class CustomerNameEditingStatusProvider extends ChangeNotifier {
  bool _editingStatus = true;

  bool get getEditingStatus => _editingStatus;

 void setEditingStatus() {
    _editingStatus = !_editingStatus;
    notifyListeners();
  }
}
class CustomerAddressEditingStatusProvider extends ChangeNotifier {
  bool _editingStatus = true;

  bool get getEditingStatus => _editingStatus;

 void setEditingStatus() {
    _editingStatus = !_editingStatus;
    notifyListeners();
  }
}
class CustomerPhoneEditingStatusProvider extends ChangeNotifier {
  bool _editingStatus = true;

  bool get getEditingStatus => _editingStatus;

  void setEditingStatus() {
    _editingStatus = !_editingStatus;
    notifyListeners();
  }
}