import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../product/utils/translations/locale_keys.g.dart';

final class UserProfileCardShopName extends StatelessWidget {
  const UserProfileCardShopName({super.key, this.shopName});
  final String? shopName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(LocaleKeys.profile_shopName.tr()),
      subtitle: Text(shopName ?? ''),
    );
  }
}
