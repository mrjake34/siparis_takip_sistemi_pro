import 'package:flutter/material.dart';

class MainElevatedIconButton extends StatelessWidget {
  const MainElevatedIconButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    super.key,
  });

  final void Function()? onPressed;
  final Widget icon;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    final pageSize = MediaQuery.of(context).size;
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(fixedSize: Size(pageSize.width, 40)),
      onPressed: onPressed,
      icon: icon,
      label: label,
    );
  }
}
