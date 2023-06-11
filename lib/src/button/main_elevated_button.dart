import 'package:flutter/material.dart';

class MainElevatedButton extends StatelessWidget {
  const MainElevatedButton(
      {super.key, required this.onPressed, required this.child});

  final Function() onPressed;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size pageSize = MediaQuery.of(context).size;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(fixedSize: Size(pageSize.width, 40)),
        onPressed: onPressed,
        child: child);
  }
}
