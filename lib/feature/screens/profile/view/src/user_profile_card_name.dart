import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../product/utils/translations/locale_keys.g.dart';

final class UserProfileCardName extends StatelessWidget {
  const UserProfileCardName({super.key, this.name});
  final String? name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(LocaleKeys.profile_fullName.tr()),
      subtitle: Text(name ?? ''),
    );
  }
}
