part of 'login_page.dart';

final class _PasswordFormField extends StatelessWidget {
  const _PasswordFormField({
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          autofillHints: const [AutofillHints.password],
          controller: passwordController,
          textInputAction: TextInputAction.done,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: state.passwordVisibility ?? true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            prefixIcon: const Icon(
              Icons.lock_outline,
              size: 20,
            ),
            hintText: LocaleKeys.mainText_enterPassword.tr(),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(
                !(state.passwordVisibility ?? true)
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
              onPressed: () =>
                  context.read<LoginBloc>().add(PasswordVisibilityEvent()),
            ),
          ),
          validator: FormBuilderValidators.compose(
            [
              FormBuilderValidators.required(
                errorText: LocaleKeys.errors_errorEnterPassword.tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}
