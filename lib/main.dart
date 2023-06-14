// ignore_for_file: use_build_context_synchronously
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/core/init/navigation/navigation_route.dart';
import 'package:siparis_takip_sistemi_pro/core/init/navigation/navigation_service.dart';
import 'package:siparis_takip_sistemi_pro/core/init/translation/translation_manager.dart';
import 'package:siparis_takip_sistemi_pro/core/init/utils/utils.dart';
import 'package:siparis_takip_sistemi_pro/providers/courier_providers.dart';
import 'package:siparis_takip_sistemi_pro/providers/customer_provider.dart';
import 'package:siparis_takip_sistemi_pro/providers/main_providers.dart';
import 'package:siparis_takip_sistemi_pro/providers/product_providers.dart';
import 'package:siparis_takip_sistemi_pro/providers/search_providers.dart';
import 'package:siparis_takip_sistemi_pro/providers/theme_providers.dart';
import 'package:siparis_takip_sistemi_pro/theme/dark_theme.dart';
import 'package:siparis_takip_sistemi_pro/theme/light_theme.dart';
import 'package:siparis_takip_sistemi_pro/theme/theme_service.dart';
import 'package:siparis_takip_sistemi_pro/views/authentication/login/bloc/login_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/authentication/login/view/login_page.dart';
import 'package:siparis_takip_sistemi_pro/views/models/user_model/user.dart';
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
      providers: [
        ChangeNotifierProvider(create: (context) => OrderDetailProvider()),
        ChangeNotifierProvider(create: (context) => OrderStatusIconProvider()),
        ChangeNotifierProvider(
          create: (context) => OrderStatusBorderColorProvider(),
        ),
        ChangeNotifierProvider(create: (context) => UserDetail()),
        ChangeNotifierProvider(create: (context) => GetUserLocation()),
        ChangeNotifierProvider(
          create: (context) => ChangeCurrencyPriceSymbol(),
        ),
        ChangeNotifierProvider(create: (context) => ThemeChange()),
        ChangeNotifierProvider(create: (context) => CourierSearch()),
        ChangeNotifierProvider(
          create: (context) => AddOrderAddCustomerSearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddOrderAddProductSearchProvider(),
        ),
        ChangeNotifierProvider(create: (context) => CustomerMapProvider()),
        ChangeNotifierProvider(
          create: (context) => ChangePasswordVisibilityProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChangePasswordVisibilityTwoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MembershipAgreementProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AllOrdersListOrderSearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EditProductNameEditButtonProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EditProductPriceEditButtonProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomerNameEditingStatusProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomerAddressEditingStatusProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomerPhoneEditingStatusProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChangePasswordVisibilityAddCourierProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChangeRePasswordVisibilityAddCourierProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EditCourierChangeNameReadyOnlyProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EditCourierChangeEmailReadyOnlyProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EditCourierChangePhoneReadyOnlyProvider(),
        )
      ],
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
    context.read<ThemeChange>().changeTheme =
        await ThemeService().getThemeFromSave() ?? lightTheme;
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
