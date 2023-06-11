import 'package:flutter/material.dart';

class AppColors {
  AppColors._init();
  static final AppColors _instance = AppColors._init();
  static AppColors get instance => _instance;

  final Color alternativeButtonColor = const Color.fromARGB(255, 49, 170, 117);
  final Color customersColor = const Color.fromARGB(255, 74, 206, 111);
  final Color couriersColor = const Color.fromARGB(255, 62, 158, 178);
  final Color ordersColor = const Color.fromARGB(255, 149, 76, 207);
  final Color productsColor = const Color.fromARGB(255, 201, 169, 57);
  final Color removeColor = Colors.red;
  final Color orderPendingColor = const Color.fromARGB(255, 217, 134, 36);
  final Color orderInProcessColor = const Color.fromARGB(255, 6, 133, 204);
  final Color orderOnTheWayColor = const Color.fromARGB(255, 13, 160, 10);
  final Color orderIsDoneColor = const Color.fromARGB(255, 110, 141, 148);
}
