import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/translations/locale_keys.g.dart';

final class LogoutDialog {
  LogoutDialog._();
  static Future<T?> logOutDialog<T>({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            LocaleKeys.mainText_logout.tr(),
            style: const TextStyle(fontSize: 15),
          ),
          content: Text(LocaleKeys.alerts_logoutAlerts.tr()),
          actions: [
            TextButton(
              onPressed: () {
                context.router.back();
              },
              child: Text(LocaleKeys.mainText_cancel.tr()),
            ),
            TextButton(
              onPressed: () async {},
              child: Text(LocaleKeys.mainText_confirm.tr()),
            ),
          ],
        );
      },
    );
  }
}
