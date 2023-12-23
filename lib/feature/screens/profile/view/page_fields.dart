part of 'profile_page.dart';

final class _PageFields extends StatelessWidget {
  const _PageFields({
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _UserProfileCardName(name: user.name),
        _UserProfileCardEmail(
          email: user.email,
        ),
        _UserProfileCardPhone(
          phone: user.phone,
        ),
        _UserProfileCardShopName(
          shopName: user.shopName,
        ),
        _UserProfileCardExpirationDate(
          dateTime: user.updatedAt ?? DateTime.now(),
        ),
      ],
    );
  }
}
