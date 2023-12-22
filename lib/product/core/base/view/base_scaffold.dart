import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/size/sizes.dart';
import '../../../src/drawer/drawer.dart';
import '../../../src/navbar/sidebar.dart';
import '../../constants/navigation/navigation_constants.dart';
import '../../../utils/navigation/navigation_service.dart';
import '../../../utils/translations/locale_keys.g.dart';

/// This is the main Scaffold widget.
final class BaseScaffold extends StatelessWidget {
  /// This is the main Scaffold widget contructor.
  const BaseScaffold({required this.body, this.appBar, super.key});

  /// This is the main Scaffold widget body.
  final Widget body;

  /// This is will edit
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ??
          AppBar(
            title: Text(LocaleKeys.mainText_title.tr()),
            centerTitle: true,
            leading:
                context.general.mediaSize.width < 800 ? null : const SizedBox(),
            actions: [
              IconButton(
                onPressed: () {
                  NavigationService.instance
                      .navigateToPage(path: NavigationConstants.userProfile);
                },
                icon: const Icon(CupertinoIcons.profile_circled),
              ),
            ],
          ),
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
          )),
        ],
      ),
    );
  }
}
