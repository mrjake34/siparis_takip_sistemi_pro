part of 'profile_page.dart';

final class _UserProfileCardShopName extends StatelessWidget {
  const _UserProfileCardShopName({this.shopName});
  final String? shopName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(LocaleKeys.profile_shopName.tr()),
      subtitle: Text(shopName ?? ''),
    );
  }
}
