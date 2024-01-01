import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../utils/router/route_manager.dart';
import '../../../utils/translations/locale_keys.g.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(LocaleKeys.mainText_title.tr()),
      centerTitle: true,
      leading: context.general.mediaSize.width < 800 ? null : const SizedBox(),
      actions: [
        IconButton(
          onPressed: () =>
              context.router.pushNamed(RoutePath.userProfileScreen.path),
          icon: const Icon(CupertinoIcons.profile_circled),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
