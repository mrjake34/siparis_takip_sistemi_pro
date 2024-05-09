part of 'courier_login_page.dart';

final class _CourierLoginButton extends StatelessWidget {
  const _CourierLoginButton({
    required GlobalKey<FormBuilderState> loginKey,
  }) : _loginKey = loginKey;

  final GlobalKey<FormBuilderState> _loginKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourierLoginPageCubit, CourierLoginPageState>(
      builder: (context, state) {
        return state.status == Status.isLoading
            ? const LoadingButton()
            : MainElevatedButton(
                onPressed: () {
                  if (_loginKey.currentState!.validate()) {
                    context.read<CourierLoginPageCubit>().loginUser();
                  } else {
                    ProductItems.customSnackBar.errorSnackBar(
                      LocaleKeys.errors_pleaseEnterAllField.tr(),
                    );
                  }
                },
                child: Text(
                  LocaleKeys.mainText_courierLogin.tr(),
                ),
              );
      },
    );
  }
}
