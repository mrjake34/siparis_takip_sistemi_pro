part of 'profile_page.dart';

final class _UserProfileCardName extends StatelessWidget {
  const _UserProfileCardName({this.name});
  final String? name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(LocaleKeys.profile_fullName.tr()),
      subtitle: Text(name ?? ''),
    );
  }
}
