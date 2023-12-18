import 'package:siparis_takip_sistemi_pro/product/core/constants/main_functions.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/colors/colors.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/icons/icons.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/cache/shared_manager.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/navigation/navigation_service.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/network/network_service.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/snackbar/snackbar.dart';

mixin class BaseModelView {
  final SharedManager sharedManager = SharedManager.instance;
  final NavigationService navService = NavigationService.instance;
  final NetworkService networkService = NetworkService.instance;
  final UtilsService utils = UtilsService.instance;
  final AppNetwork appNetwork = AppNetwork.instance;
  final AppColors appColors = AppColors.instance;
  final AppIcons appIcons = AppIcons.instance;
  final MainFunctions mainFunctions = MainFunctions.instance;
}
