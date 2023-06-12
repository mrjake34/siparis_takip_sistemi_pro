import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../base/models/base_model_view.dart';
import '../../init/translation/locale_keys.g.dart';

class MainFuncs with BaseModelView {
  Future<void> openMembershipAgreement() async {
    try {
      if (!await launchUrl(appNetwork.membershipAgreementLink,
          mode: LaunchMode.platformDefault)) {}
    } catch (e) {
      utils.errorSnackBar(LocaleKeys.errors_errorGoogleDocs.tr());
    }
  }
}