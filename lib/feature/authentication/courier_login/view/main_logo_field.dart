part of 'courier_login_page.dart';

final class _MainLogoField extends StatelessWidget {
  const _MainLogoField();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppStrings.mainLogoPath,
      fit: BoxFit.fill,
    );
  }
}
