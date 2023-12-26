import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NavbarButton extends StatelessWidget {
  const NavbarButton({
    required this.icon,
    required this.text,
    required this.onPressed,
    super.key,
  });
  final IconData icon;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return Colors.lightGreenAccent;
          } else if (states.contains(MaterialState.focused)) {
            return Colors.deepOrange;
          } else if (states.contains(MaterialState.pressed)) {
            return Colors.deepOrange;
          }
          return Theme.of(context).colorScheme.primary;
        }),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(text.tr().toUpperCase()),
    );
  }
}
