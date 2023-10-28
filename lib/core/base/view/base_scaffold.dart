import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../src/drawer/drawer.dart';
import '../../../src/navbar/sidebar.dart';
import '../../constants/navigation/navigation_constants.dart';
import '../../utils/navigation/navigation_service.dart';
import '../../utils/translation/locale_keys.g.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({required this.body, this.appBar, super.key});
  final Widget body;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ??
          AppBar(
            title: Text(LocaleKeys.mainText_title.tr()),
            centerTitle: true,
            leading: context.general.mediaSize.width < 800 ? null : const SizedBox(),
            actions: [
              IconButton(
                onPressed: () {
                  NavigationService.instance.navigateToPage(path: NavigationConstants.userProfile);
                },
                icon: const Icon(CupertinoIcons.profile_circled),
              ),
            ],
          ),
      drawer: context.general.mediaSize.width < 800 ? const DrawerWidget() : null,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (context.general.mediaSize.width > 800) const SizedBox(width: 250, child: SideBar()),
          Flexible(child: body),
        ],
      ),
    );
  }
}
