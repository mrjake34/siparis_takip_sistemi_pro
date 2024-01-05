import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/bloc/login_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/service/login_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/service/profile_service.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/router/route_manager.dart';

/// This class is an starter screen for the app
/// It checks the user role and navigates to the related screen
/// If the user is not logged in, it navigates to the login screen
/// and will start all the services needed for the app
@RoutePage()
final class SplashScreen extends StatefulWidget {
  /// This is contructor method for the splash screen
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

final class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        loginService: LoginService(),
        profileService: ProfileService(),
      )..add(const AutoLoginEvent()),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.model != null) {
            context.router.replaceNamed(RoutePath.splashScreen.path);
          }
          context.router.replaceNamed(RoutePath.loginScreen.path);
        },
        builder: (context, state) {
          return const BaseScaffold(
            appBar: false,
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        },
      ),
    );
  }
}
