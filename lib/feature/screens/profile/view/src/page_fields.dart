import 'package:flutter/material.dart';
import '../../model/user_model.dart';
import 'index.dart';

final class PageFields extends StatelessWidget {
  const PageFields({
    required this.user,
    super.key,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        UserProfileCardName(name: user.name),
        UserProfileCardEmail(
          email: user.email,
        ),
        UserProfileCardPhone(
          phone: user.phone,
        ),
        UserProfileCardShopName(
          shopName: user.shopName,
        ),
        UserProfileCardExpirationDate(
          dateTime: user.updatedAt ?? DateTime.now(),
        ),
      ],
    );
  }
}
