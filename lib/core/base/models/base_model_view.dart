import 'package:siparis_takip_sistemi_pro/components/main_functions.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/colors/colors.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/icons/icons.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/core/utils/cache/shared_manager.dart';
import 'package:siparis_takip_sistemi_pro/core/utils/navigation/navigation_service.dart';
import 'package:siparis_takip_sistemi_pro/core/utils/network/network_service.dart';
import 'package:siparis_takip_sistemi_pro/core/utils/utils/utils.dart';

mixin class BaseModelView {
  final SharedManager sharedManager = SharedManager.instance;
  final NavigationService navService = NavigationService.instance;
  final NetworkService networkService = NetworkService();
  final UtilsService utils = UtilsService.instance;
  final AppNetwork appNetwork = AppNetwork.instance;
  final AppColors appColors = AppColors.instance;
  final AppIcons appIcons = AppIcons.instance;
  final MainFunctions mainFunctions = MainFunctions.instance;
}
