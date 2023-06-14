import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/core/init/navigation/inavigation_sevice.dart';

class NavigationService implements INavigationService {
  NavigationService._init();
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  bool Function(Route<dynamic> route) removeAllRoutes =
      (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({String? path, Object? object}) async {
    await navigatorKey.currentState!.pushNamed(path!, arguments: object);
  }

  @override
  Future<void> navigateToPageRemoveAll({String? path, Object? object}) async {
    await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path!, removeAllRoutes, arguments: object);
  }

  @override
  void navigateToBack() {
    navigatorKey.currentState!.pop();
  }
}
