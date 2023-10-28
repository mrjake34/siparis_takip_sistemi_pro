import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:siparis_takip_sistemi_pro/core/utils/navigation/navigation_service.dart';
import '../../core/constants/colors/colors.dart';
import '../../core/utils/translation/locale_keys.g.dart';

final class CardMoreButton {
  const CardMoreButton._();

  static Future<void> openMenu({
    required BuildContext context,
    required Offset offset,
    required String id,
    required String path,
    required void Function() function,
  }) {
    return showMenu(
      context: context,
      position: RelativeRect.fromLTRB(offset.dx, offset.dy, offset.dx + 200, offset.dy + 100),
      items: [
        PopupMenuItem(
          onTap: () {
            if (id.ext.isNotNullOrNoEmpty && path.ext.isNotNullOrNoEmpty) {
              NavigationService.instance.navigateToPage(path: path, object: id);
            }
          },
          child: Text(
            LocaleKeys.mainText_edit.tr(),
            style: TextStyle(color: AppColors.instance.editColor),
          ),
        ),
        PopupMenuItem(
          onTap: () => openDialog(context, function: function),
          child: Text(
            LocaleKeys.mainText_remove.tr(),
            style: TextStyle(color: AppColors.instance.removeColor),
          ),
        ),
      ],
    );
  }

  static Future<void> openDialog(BuildContext context, {required void Function() function}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          shape: const OutlineInputBorder(),
          content: Text(
            LocaleKeys.alerts_removeAlert.tr(),
            textAlign: TextAlign.center,
          ),
          title: const Icon(
            Icons.warning_amber,
            size: 50,
          ),
          actions: [
            TextButton(
              style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.3)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                LocaleKeys.mainText_cancel.tr(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const Spacer(),
            TextButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.instance.removeColor),
              onPressed: function,
              child: Text(
                LocaleKeys.mainText_remove.tr(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}