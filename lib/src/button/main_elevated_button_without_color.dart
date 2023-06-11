import 'package:flutter/material.dart';
import '../../core/constants/colors/colors.dart';

class MainElevatedButtonWithoutColor extends StatelessWidget {
  const MainElevatedButtonWithoutColor(
      {super.key, required this.onPressed, required this.child, this.color});

  final Function() onPressed;
  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size pageSize = MediaQuery.of(context).size;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(pageSize.width, 40),
            backgroundColor:
                color ?? AppColors.instance.alternativeButtonColor),
        onPressed: onPressed,
        child: child);
  }
}
