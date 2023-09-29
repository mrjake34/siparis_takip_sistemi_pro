// ignore_for_file: avoid_setters_without_getters

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:latlong2/latlong.dart' as latlong2;

class GetUserLocation with ChangeNotifier {
  Position _position = Position(
    longitude: 0,
    latitude: 0,
    timestamp: DateTime.now(),
    accuracy: 0,
    altitude: 0,
    heading: 0,
    speed: 0,
    speedAccuracy: 0,
    altitudeAccuracy: 0,
    headingAccuracy: 0,
  );
  LatLng _googleMapLatLng = const LatLng(0, 0);
  latlong2.LatLng _alternativeMapLatLng2 = const latlong2.LatLng(0, 0);

  LatLng get getGoogleMapLatLng => _googleMapLatLng;
  latlong2.LatLng get getAlternativeMapLatLng2 => _alternativeMapLatLng2;


  set setLatLng(LatLng value) {
    _googleMapLatLng = value;
    notifyListeners();
  }

  set setLatLng2(latlong2.LatLng value) {
    _alternativeMapLatLng2 = value;
    notifyListeners();
  }
  Position get getPosition => _position;
  set setPosition(Position value) {
    _position = value;
    notifyListeners();
  }
}

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
