import 'package:easy_localization/easy_localization.dart';
import 'package:siparis_takip_sistemi_pro/core/base/models/base_model_view.dart';
import 'package:siparis_takip_sistemi_pro/core/init/translation/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';

class MainFuncs with BaseModelView {
  Future<void> openMembershipAgreement() async {
    try {
      if (!await launchUrl(
        appNetwork.membershipAgreementLink,
        mode: LaunchMode.externalApplication,
      )) {}
    } catch (e) {
      utils.errorSnackBar(LocaleKeys.errors_errorGoogleDocs.tr());
    }
  }
}
