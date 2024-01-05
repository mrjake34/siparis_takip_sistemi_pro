import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../product/utils/translations/locale_keys.g.dart';

final class UserProfileCardPhone extends StatelessWidget {
  const UserProfileCardPhone({super.key, this.phone});
  final String? phone;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(LocaleKeys.profile_phoneNumber.tr()),
      subtitle: Text(phone ?? ''),
    );
  }
}
