import 'package:flutter/material.dart';

final class CustomDialog {
  CustomDialog._();

  static Future<T?> showCustomDialog<T>(
    BuildContext context,
    Widget child,
  ) async {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          shape: const RoundedRectangleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: child,
          ),
        );
      },
    );
  }

  static Future<T?> showCustomDialogError<T>(
    BuildContext context,
    Widget child,
  ) async {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          shape: const RoundedRectangleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: child,
          ),
        );
      },
    );
  }
}
