import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  const ListCard({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: false,
      borderOnForeground: false,
      color: Theme.of(context).colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      child: child,
    );
  }
}
