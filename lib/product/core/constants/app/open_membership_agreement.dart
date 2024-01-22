import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:url_launcher/url_launcher.dart';

final class OpenMembershipAgreement {
  OpenMembershipAgreement._init();
  static Future<bool> openMembershipAgreement() async {
    final uri = Uri.parse(AppNetwork.membershipAgreementLink);
    if (!await canLaunchUrl(uri)) {
      return launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      return false;
    }
  }
}
