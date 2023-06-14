import 'package:flutter/material.dart';

class MainElevatedButton extends StatelessWidget {
  const MainElevatedButton({
    required this.onPressed,
    required this.child,
    super.key,
  });

  final void Function() onPressed;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final pageSize = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(fixedSize: Size(pageSize.width, 40)),
      onPressed: onPressed,
      child: child,
    );
  }
}
