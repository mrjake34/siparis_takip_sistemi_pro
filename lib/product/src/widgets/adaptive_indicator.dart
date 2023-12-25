import 'package:flutter/material.dart';

final class AdaptiveIndicator extends StatelessWidget {
  const AdaptiveIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
