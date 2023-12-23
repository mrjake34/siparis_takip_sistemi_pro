part of 'profile_page.dart';

final class _UserProfileCardExpirationDate extends StatelessWidget {
  const _UserProfileCardExpirationDate({
    required this.dateTime,
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
