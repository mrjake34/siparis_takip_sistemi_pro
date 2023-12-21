import 'package:flutter/material.dart';

final class CustomSnackBar {
  CustomSnackBar._();

  static final GlobalKey<ScaffoldMessengerState> _messengerKey = GlobalKey();
  static GlobalKey<ScaffoldMessengerState> get messengerKey => _messengerKey;

  static void showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(content: Text(text));

    _messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void errorSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );

    _messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
