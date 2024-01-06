part of '../profile_page.dart';

final class _ProfilePageLogoutButton extends StatelessWidget {
  const _ProfilePageLogoutButton();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        loginService: LoginService(),
        profileService: ProfileService(),
      ),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.userStatus == UserStatus.logout) {
            context.router.replaceNamed(RoutePath.loginScreen.path);
          }
        },
        builder: (context, state) {
          if (state.status == Status.isLoading) return const LoadingButton();
          return Padding(
            padding: const EdgeInsets.all(5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: Colors.red,
                fixedSize: Size(context.general.mediaSize.width, 40),
              ),
              onPressed: () {
                context
                  ..read<ProfilePageBloc>().add(UserLogoutEvent())
                  ..read<LoginBloc>().add(LogoutEvent());
              },
              child: Text(LocaleKeys.mainText_logout.tr()),
            ),
          );
        },
      ),
    );
  }
}
