import 'package:flutter/material.dart';

import '../../core/constants/colors/colors.dart';

class MainElevatedButtonWithoutColor extends StatelessWidget {
  const MainElevatedButtonWithoutColor({
    required this.onPressed,
    required this.child,
    super.key,
    this.color,
  });

  final void Function() onPressed;
  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final pageSize = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(pageSize.width, 40),
        maximumSize: const Size(300, 40),
        backgroundColor: color ?? AppColors.alternativeButtonColor,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
