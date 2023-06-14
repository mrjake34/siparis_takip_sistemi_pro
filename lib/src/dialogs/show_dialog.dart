import 'package:flutter/material.dart';

class CustomDialog {
  Future<void> showCustomDialog(BuildContext context, Widget child) async {
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

  Future<void> showCustomDialogError(BuildContext context, Widget child) async {
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
