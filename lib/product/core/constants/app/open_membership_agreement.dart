import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:url_launcher/url_launcher.dart';

final class OpenMembershipAgreement {
  OpenMembershipAgreement._init();
  static Future<bool> openMembershipAgreement() async {
    if (!await canLaunchUrl(
      Uri.parse(AppNetwork.membershipAgreementLink),
    )) {
      return launchUrl(
        Uri.parse(AppNetwork.membershipAgreementLink),
        mode: LaunchMode.externalApplication,
      );
    } else {
      return false;
    }
  }
}
