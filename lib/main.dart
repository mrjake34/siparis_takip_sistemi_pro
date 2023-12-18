import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/bloc/login_bloc.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/init/app_initialize.dart';
import 'package:siparis_takip_sistemi_pro/product/theme/dark_theme.dart';
import 'package:siparis_takip_sistemi_pro/product/theme/light_theme.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/localization/localization_manager.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/notifier/notifier.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/provider/prodiver_manager.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/router/route_manager.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/snackbar/snackbar.dart';

void main() async {
  await AppInitialize.init();
  runApp(
    MultiProvider(
      providers: AppNotifiers.instance.notifierList,
      child: LocalizationManager(
        child: const ProviderManager(
          child: MyApp(),
        ),
      ),
    ),
  );
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  /// This is the main application widget.
  const MyApp({super.key});
  static final _routeManager = RouteManager();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: UtilsService.instance.messengerKey,
      routerConfig: _routeManager.config(),
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      title: 'OTS PRO',
      supportedLocales: context.supportedLocales,
    );
  }
}
