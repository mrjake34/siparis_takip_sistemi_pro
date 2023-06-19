import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/components/main-functions.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/colors/colors.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/icons/icons.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/core/singletons/cache/shared_manager.dart';
import 'package:siparis_takip_sistemi_pro/core/singletons/navigation/navigation_service.dart';
import 'package:siparis_takip_sistemi_pro/core/singletons/network/network_service.dart';
import 'package:siparis_takip_sistemi_pro/core/singletons/utils/utils.dart';

mixin class BaseModelView {
  BuildContext? viewContext;

  SharedManager sharedManager = SharedManager.instance;
  NavigationService navService = NavigationService.instance;
  NetworkService networkService = NetworkService();
  UtilsService utils = UtilsService.instance;
  AppNetwork appNetwork = AppNetwork.instance;
  AppColors appColors = AppColors.instance;
  AppIcons appIcons = AppIcons.instance;
  MainFunctions mainFunctions = MainFunctions.instance;
}
