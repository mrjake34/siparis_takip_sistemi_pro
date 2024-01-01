import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_appbar.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/size/sizes.dart';

import '../../../src/drawer/drawer.dart';
import '../../../src/navbar/sidebar.dart';

/// This is the main Scaffold widget.
final class BaseScaffold extends StatelessWidget {
  /// This is the main Scaffold widget contructor.
  const BaseScaffold({required this.body, this.appBar, super.key});

  /// This is the main Scaffold widget body.
  final Widget body;

  /// This is will edit
  final bool? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar == false ? null : const CustomAppBar(),
      drawer:
          context.general.mediaSize.width < 800 ? const DrawerWidget() : null,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Builder(
            builder: (context) {
              if (context.general.mediaSize.width > 800) {
                return const SizedBox(width: 250, child: SideBar());
              } else {
                return const SizedBox();
              }
            },
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(AppSize.pagePadding),
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}
