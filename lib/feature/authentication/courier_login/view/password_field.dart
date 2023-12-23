part of 'courier_login_page.dart';

final class _PasswordField extends StatelessWidget {
  const _PasswordField({
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourierLoginPageCubit, CourierLoginPageState>(
      builder: (context, state) {
        return TextFormField(
          controller: passwordController,
          textInputAction: TextInputAction.done,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          autofillHints: const [AutofillHints.password],
          obscureText: state.isPasswordVisible ?? true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            prefixIcon: const Icon(Icons.lock_outline, size: 20),
            hintText: LocaleKeys.mainText_enterPassword.tr(),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(
                (state.isPasswordVisible ?? true)
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
              onPressed: () =>
                  context.read<CourierLoginPageCubit>().changeVisibility(),
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
