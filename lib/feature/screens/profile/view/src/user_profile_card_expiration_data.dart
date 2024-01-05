import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../product/utils/translations/locale_keys.g.dart';

final class UserProfileCardExpirationDate extends StatelessWidget {
  const UserProfileCardExpirationDate({
    required this.dateTime,
    super.key,
  });
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(LocaleKeys.profile_expirationDate.tr()),
      subtitle: Text(DateFormat('dd/MM/yyyy').format(dateTime)),
    );
  }
}
