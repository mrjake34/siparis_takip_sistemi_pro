import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../base/models/base_model_view.dart';
import '../../utils/translation/locale_keys.g.dart';

final class OpenMembershipAgreement with BaseModelView {
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