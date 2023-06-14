import 'package:flutter/material.dart';

import 'package:siparis_takip_sistemi_pro/core/constants/colors/colors.dart';

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
        backgroundColor: color ?? AppColors.instance.alternativeButtonColor,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
