import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/colors/colors.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/core/init/translation/locale_keys.g.dart';

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
      itemBuilder: (context) {
        return <PopupMenuEntry<PopupMenuItemEnum>>[
          PopupMenuItem(
            value: PopupMenuItemEnum.edit,
            child: Text(
              LocaleKeys.mainText_edit.tr(),
              style: const TextStyle(color: Colors.blue),
            ),
            onTap: () {
              Navigator.push(context, pageRouterEdit());
            },
          ),
          PopupMenuItem(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      LocaleKeys.mainText_remove.tr(),
                      style: const TextStyle(fontSize: 15),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, pageRouterEdit());
                        },
                        child: Text(LocaleKeys.mainText_cancel.tr()),
                      ),
                      TextButton(
                        onPressed: removeFunction,
                        child: Text(LocaleKeys.mainText_confirm.tr()),
                      ),
                    ],
                  );
                },
              );
            },
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

  MaterialPageRoute<dynamic> pageRouterEdit() {
    return MaterialPageRoute(
      builder: (context) => routerWidget,
    );
  }
}
