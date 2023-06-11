import 'package:flutter/material.dart';

class MainElevatedIconButton extends StatelessWidget {
  const MainElevatedIconButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.label});

  final Function()? onPressed;
  final Widget icon;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    Size pageSize = MediaQuery.of(context).size;
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(fixedSize: Size(pageSize.width, 40)),
        onPressed: onPressed,
        icon: icon,
        label: label);
  }
}
