import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../core/constants/colors/colors.dart';
import '../../core/constants/enums/enums.dart';
import '../../core/utils/translation/locale_keys.g.dart';

class CardMoreButtonField extends StatelessWidget {
  const CardMoreButtonField({
    required this.removeFunction,
    required this.routerWidget,
    this.id,
    super.key,
  });

  final String? id;
  final void Function() removeFunction;
  final Widget routerWidget;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<PopupMenuItemEnum>(
      onSelected: (value) {
        if (value == PopupMenuItemEnum.edit) {
          Navigator.push(context, pageRouterEdit());
        } else if (value == PopupMenuItemEnum.remove) {
          openDialog(context);
        }
      },
      itemBuilder: (context) {
        return <PopupMenuEntry<PopupMenuItemEnum>>[
          PopupMenuItem(
            value: PopupMenuItemEnum.edit,
            child: Text(
              LocaleKeys.mainText_edit.tr(),
              style: TextStyle(color: AppColors.instance.editColor),
            ),
          ),
          PopupMenuItem(
            value: PopupMenuItemEnum.remove,
            child: Text(
              LocaleKeys.mainText_remove.tr(),
              style: TextStyle(color: AppColors.instance.removeColor),
            ),
          )
        ];
      },
    );
  }

  Future<dynamic> openDialog(BuildContext context) {
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
              onPressed: removeFunction,
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

  MaterialPageRoute<dynamic> pageRouterEdit() {
    return MaterialPageRoute(
      builder: (context) => routerWidget,
    );
  }
}
