import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin class AppConstats {
  AppConstats._init();
  static final AppConstats _instance = AppConstats._init();
  static AppConstats get instance => _instance;

  static const String translationPath = "assets/translations";

  //Links
  Uri membershipAgreementLink = Uri.parse(
      'https://docs.google.com/document/d/1GbY7iw8yARRuZWVmnEo7nzTI96z_4eH6G5VkUWDaI34');
  static const String baseUrl = "https://api.efes.tech";
  static const login = '/login';
  static const signup = '/signup';
  static const String loginUserUrl = "https://api.efes.tech/login";
  static const String refreshTokenUrl = "https://api.efes.tech/refresh/";
  static const String sendUserUrl = "https://api.efes.tech/signup";
  static const String getUserUrl = "https://api.efes.tech/user/";
  static const String postOrderUrl = "https://api.efes.tech/orders";
  static const String getOrderUrl = "https://api.efes.tech/orders/";
  static const String getCouriersUrl = "https://api.efes.tech/couriers";
  static const String courierLoginUrl = "https://api.efes.tech/couriers/login";
  static const String deleteCourierUrl = "https://api.efes.tech/couriers/";
  static const String getCustomerUrl = "https://api.efes.tech/customers";
  static const String deleteCustomerUrl = "https://api.efes.tech/customers/";
  final String productUrl = "https://api.efes.tech/products";
  final String productUrlWithSlash = "https://api.efes.tech/products/";

  final IconData orderListIcon = Icons.list_alt;
  final IconData isDoneIcon = Icons.task_alt;
  final IconData onTheWayIcon = Icons.delivery_dining_outlined;
  final IconData inProcessIcon = Icons.access_time;
  final IconData pendingIcon = Icons.pending_outlined;
  final IconData produtIcon = Icons.view_in_ar;
  final IconData moreIcon = Icons.miscellaneous_services_outlined;
}
