import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:latlong2/latlong.dart' as latlong2;

import '../core/constants/app/app_constants.dart';
import '../views/screens/orders/model/order.dart';

class ChangeCurrencyPriceSymbol with ChangeNotifier {
  String currencySymbol = "₺";

  String get getSymbol {
    return currencySymbol;
  }

  set changeSymbol(String value) {
    currencySymbol = value;
    notifyListeners();
  }
}

class GetUserLocation with ChangeNotifier {
  Position _position = Position(
      longitude: 0.0,
      latitude: 0.0,
      timestamp: DateTime.now(),
      accuracy: 0.0,
      altitude: 0.0,
      heading: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0);
  LatLng _googleMapLatLng = const LatLng(0.0, 0.0);
  latlong2.LatLng _alternativeMapLatLng2 = const latlong2.LatLng(0.0, 0.0);

  LatLng get getGoogleMapLatLng => _googleMapLatLng;
  latlong2.LatLng get getAlternativeMapLatLng2 => _alternativeMapLatLng2;
  Position get getPosition => _position;

  set setLatLng(LatLng value) {
    _googleMapLatLng = value;
    notifyListeners();
  }

  set setLatLng2(latlong2.LatLng value) {
    _alternativeMapLatLng2 = value;
    notifyListeners();
  }

  set setPosition(Position value) {
    _position = value;
    notifyListeners();
  }
}

class OrderStatusBorderColorProvider with ChangeNotifier {
  Color _color = Colors.limeAccent;

  Color get getOrderStatusBorderColor => _color;

  set setOrderStatusBorderColor(Color value) {
    _color = value;
    notifyListeners();
  }
}

class OrderStatusIconProvider with ChangeNotifier {
  IconData _icon = AppConstats.instance.pendingIcon;

  IconData get getOrderStatusIcon => _icon;

  set setOrderStatusIcon(IconData value) {
    _icon = value;
    notifyListeners();
  }
}

class ChangePasswordVisibilityProvider extends ChangeNotifier {
  bool _visibility = true;

  bool get getVisibility => _visibility;

  set setVisibility(bool value) {
    _visibility = value;
    notifyListeners();
  }
}

class ChangePasswordVisibilityTwoProvider extends ChangeNotifier {
  bool _visibility = true;

  bool get getVisibility => _visibility;

  set setVisibility(bool value) {
    _visibility = value;
    notifyListeners();
  }
}

class MembershipAgreementProvider extends ChangeNotifier {
  bool _agreement = false;

  bool get getAgreement => _agreement;

  set setAgreement(bool value) {
    _agreement = value;
    notifyListeners();
  }
}



class OrderDetailProvider with ChangeNotifier {
  List<Order> order = [];

  List<Order> get getOrders => order;

  set addOrder(Order value) {
    order.add(value);
    notifyListeners();
  }
}
