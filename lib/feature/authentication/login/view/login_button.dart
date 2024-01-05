part of 'login_page.dart';

final class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required this.loginKey,
    required this.emailController,
    required this.passwordController,
  });
  final GlobalKey<FormBuilderState> loginKey;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == Status.isFailed) {
          CustomSnackBar.errorSnackBar(state.errorMessage);
        } else if (state.status == Status.isDone) {
          if (state.model != null) {
            context.router.replaceNamed(RoutePath.homeScreen.path);
          }
        }
      },
      builder: (context, state) {
        if (state.status == Status.isLoading) {
          return const LoadingButton();
        } else {
          return MainElevatedButton(
            onPressed: () {
              if (loginKey.currentState?.validate() ?? false) {
                context.read<LoginBloc>().add(
                      UserLoginEvent(
                        model: LoginRequestModel(
                          email: emailController?.text,
                          password: passwordController?.text,
                        ),
                      ),
                    );
              } else {
                CustomSnackBar.errorSnackBar(
                  LocaleKeys.errors_pleaseEnterAllField.tr(),
                );
              }
            },
            child: Text(
              LocaleKeys.mainText_login.tr(),
            ),
          );
        }
      },
    );
  }
}
