// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/core/utils/navigation/navigation_route.dart';
import 'package:siparis_takip_sistemi_pro/core/utils/navigation/navigation_service.dart';
import 'package:siparis_takip_sistemi_pro/core/utils/notifier/notifier.dart';
import 'package:siparis_takip_sistemi_pro/core/utils/translation/translation_manager.dart';
import 'package:siparis_takip_sistemi_pro/core/utils/utils/utils.dart';
import 'package:siparis_takip_sistemi_pro/providers/theme_providers.dart';
import 'package:siparis_takip_sistemi_pro/theme/dark_theme.dart';
import 'package:siparis_takip_sistemi_pro/theme/light_theme.dart';
import 'package:siparis_takip_sistemi_pro/theme/theme_service.dart';
import 'package:siparis_takip_sistemi_pro/views/authentication/login/bloc/login_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/authentication/login/view/login_page.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/courier/bloc/courier_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/customer/bloc/customer_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/bloc/add_order_bloc/orders_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/product/bloc/products_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/profile/bloc/user_profile_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/splash/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiProvider(
      providers: AppNotifiers.instance.notifierList,
      child: EasyLocalization(
        path: AppNetwork.instance.translationPath,
        supportedLocales: TranslationManager.instance!.supportedLocales,
        startLocale: TranslationManager.instance!.enLocale,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LoginBloc(),
            ),
            BlocProvider(
              create: (context) => CustomerBloc(),
            ),
            BlocProvider(
              create: (context) => CourierBloc(),
            ),
            BlocProvider(
              create: (context) => OrdersBloc(),
            ),
            BlocProvider(
              create: (context) => ProductsBloc(),
            ),
            BlocProvider(
              create: (context) => UserProfileBloc(),
            ),
          ],
          child: const MyApp(),
        ),
      ),
    ),
  );
  FlutterNativeSplash.remove();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData? theme;
  @override
  void initState() {
    checkTheme();
    super.initState();
  }

  Future<void> checkTheme() async {
    final theme = await ThemeService().getThemeFromSave();
    if (theme != null) {
      context.read<ThemeChange>().changeTheme = theme;
    }
  }

  @override
  Widget build(BuildContext context) {
    context.read<LoginBloc>().add(AutoLoginEvent());
    return MaterialApp(
      scaffoldMessengerKey: UtilsService.instance.messengerKey,
      navigatorKey: NavigationService.instance.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeChange>().getTheme ?? lightTheme,
      darkTheme: context.watch<ThemeChange>().getTheme ?? darkTheme,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      home: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state.autoLogin == AutoLogin.completed) {
            return SplashScreen();
          } else if (state.autoLogin == AutoLogin.failed) {
            return LoginPage();
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          }
        },
      ),
    );
  }
}
