import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/components/main-functions.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/app/app_constants.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/colors/colors.dart';
import '../../init/cache/shared_manager.dart';
import '../../init/navigation/navigation_service.dart';
import '../../init/network/network_service.dart';
import '../../init/utils/utils.dart';

mixin class BaseModelView {
  BuildContext? viewContext;

  SharedManager sharedManager = SharedManager.instance;
  NavigationService navService = NavigationService.instance;
  NetworkService networkService = NetworkService();
  UtilsService utils = UtilsService.instance;
  AppConstats appConstats = AppConstats.instance;
  AppColors appColors = AppColors.instance;
  MainFunctions mainFunctions = MainFunctions.instance;
}
