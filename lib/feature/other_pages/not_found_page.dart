import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../product/core/constants/navigation/navigation_constants.dart';
import '../../product/utils/navigation/navigation_service.dart';
import '../../product/utils/translations/locale_keys.g.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            NavigationService.instance
                .navigateToPage(path: NavigationConstants.splashScreen);
          },
          child: Text(LocaleKeys.mainText_pageNotFound.tr()),
        ),
      ),
    );
  }
}
