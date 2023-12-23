part of 'profile_page.dart';

final class _UserProfileCardPhone extends StatelessWidget {
  const _UserProfileCardPhone({this.phone});
  final String? phone;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(LocaleKeys.profile_phoneNumber.tr()),
      subtitle: Text(phone ?? ''),
    );
  }
}
