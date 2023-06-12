import 'package:flutter/material.dart';
import '../../../components/main-functions.dart';
import '../../constants/network/url.dart';
import '../../constants/colors/colors.dart';
import '../../constants/icons/icons.dart';
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
  AppNetwork appNetwork = AppNetwork.instance;
  AppColors appColors = AppColors.instance;
  AppIcons appIcons = AppIcons.instance;
  MainFunctions mainFunctions = MainFunctions.instance;
}
