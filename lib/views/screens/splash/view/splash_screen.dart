// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/core/base/models/base_model_view.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/core/singletons/translation/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/home_page/view/home_page_view.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/splash/cubit/splash_screen_cubit.dart';

class SplashScreen extends StatelessWidget with BaseModelView {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashScreenCubit().init();
    return BlocProvider(
      create: (context) => SplashScreenCubit(),
      child: BlocConsumer<SplashScreenCubit, SplashScreenState>(
        listener: (context, state) {
          if (state.locationService == LocationService.serviceOff) {
            utils.errorSnackBar(LocaleKeys.errors_locationServiceOff.tr());
            context.read<SplashScreenCubit>().init();
          }
          if (state.locationService == LocationService.denied) {
            utils
                .errorSnackBar(LocaleKeys.errors_locationPermissionDenied.tr());
          } else if (state.locationService == LocationService.deniedForever) {
            utils.errorSnackBar(
                LocaleKeys.errors_locationServiceDeniedForever.tr(),);
          }
        },
        builder: (context, state) {
          if (state.status == Status.isLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          } else {
            return HomePageView(
              userRole: state.role ?? '',
            );
          }
        },
      ),
    );
  }
}
