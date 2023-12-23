import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../product/utils/router/route_manager.dart';
import '../../product/utils/translations/locale_keys.g.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () =>
              context.router.replaceNamed(RoutePath.homeScreen.path),
          child: Text(LocaleKeys.mainText_pageNotFound.tr()),
        ),
      ),
    );
  }
}
