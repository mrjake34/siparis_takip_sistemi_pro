import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Center(
          child: LoadingAnimationWidget.fourRotatingDots(
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
    );
  }
}
