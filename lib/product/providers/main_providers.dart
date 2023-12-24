// ignore_for_file: avoid_setters_without_getters

import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/colors/colors.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/icons/icons.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/model/order_model.dart';

class ChangeCurrencyPriceSymbol with ChangeNotifier {
  String currencySymbol = '₺';

  String get getSymbol {
    return currencySymbol;
  }

  set changeSymbol(String value) {
    currencySymbol = value;
    notifyListeners();
  }
}

class OrderStatusBorderColorProvider with ChangeNotifier {
  Color _color = AppColors.instance.orderPendingColor;

  Color get getOrderStatusBorderColor => _color;

  set setOrderStatusBorderColor(Color value) {
    _color = value;
    notifyListeners();
  }
}

class OrderStatusIconProvider with ChangeNotifier {
  IconData _icon = AppIcons.instance.pendingIcon;

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
  List<OrderListProduct> order = [];

  List<OrderListProduct> get getOrders => order;

  set addOrder(OrderListProduct value) {
    order.add(value);
    notifyListeners();
  }
}
