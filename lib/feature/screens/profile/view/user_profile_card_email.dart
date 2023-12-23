part of 'profile_page.dart';

final class _UserProfileCardEmail extends StatelessWidget {
  const _UserProfileCardEmail({this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(LocaleKeys.profile_emailAddress.tr()),
      subtitle: Text(email ?? ''),
    );
  }
}
