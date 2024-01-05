import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../product/utils/translations/locale_keys.g.dart';

final class UserProfileCardEmail extends StatelessWidget {
  const UserProfileCardEmail({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(LocaleKeys.profile_emailAddress.tr()),
      subtitle: Text(email ?? ''),
    );
  }
}
