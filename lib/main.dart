import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/init/app_initialize.dart';
import 'package:siparis_takip_sistemi_pro/product/theme/dark_theme.dart';
import 'package:siparis_takip_sistemi_pro/product/theme/light_theme.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/localization_manager.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/provider/prodiver_manager.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/router/route_manager.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/snackbar/snackbar.dart';
import 'product/core/base/provider/theme/theme_cubit.dart';

void main() async {
  await AppInitialize.init();
  runApp(
    LocalizationManager(
      child: const ProviderManager(
        child: MyApp(),
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
      scaffoldMessengerKey: CustomSnackBar.messengerKey,
      routerConfig: _routeManager.config(),
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      themeMode: context.watch<ThemeCubit>().state.themeMode,
      title: 'OTS PRO',
      supportedLocales: context.supportedLocales,
    );
  }
}
