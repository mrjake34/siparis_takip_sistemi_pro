import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';

final class CustomSnackBar {
  CustomSnackBar._();

  factory CustomSnackBar.newInstance() => CustomSnackBar._();

  final GlobalKey<ScaffoldMessengerState> _messengerKey = GlobalKey();
  GlobalKey<ScaffoldMessengerState> get messengerKey => _messengerKey;

  void showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(content: Text(text));

    _messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void errorSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      action: SnackBarAction(
        label: LocaleKeys.mainText_cancel.tr(),
        onPressed: () {
          _messengerKey.currentState!.hideCurrentSnackBar();
        },
      ),
    );

    _messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
