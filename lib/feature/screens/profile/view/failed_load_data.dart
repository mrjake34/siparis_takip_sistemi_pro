part of 'profile_page.dart';

final class _FailedLoadData extends StatelessWidget {
  const _FailedLoadData();

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(LocaleKeys.errors_failedLoadData.tr()));
  }
}
