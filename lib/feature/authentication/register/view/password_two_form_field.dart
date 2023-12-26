part of 'register_page.dart';

final class _PasswordTwoFormField extends StatelessWidget {
  const _PasswordTwoFormField({
    required this.password2Controller,
  });

  final TextEditingController password2Controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          controller: password2Controller,
          textInputAction: TextInputAction.done,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          autofillHints: const [AutofillHints.password],
          obscureText: state.passwordAgainVisibility ?? true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            prefixIcon: const Icon(Icons.lock_outline, size: 20),
            hintText: LocaleKeys.mainText_rePassword.tr(),
            suffixIcon: IconButton(
              icon: Icon(
                state.passwordAgainVisibility == false
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
              onPressed: () {
                context.read<RegisterCubit>().passwordAgainVisibility();
              },
            ),
          ),
          validator: FormBuilderValidators.compose(
            [
              FormBuilderValidators.required(
                errorText: LocaleKeys.errors_errorEnterPassword.tr(),
              ),
              FormBuilderValidators.minLength(
                6,
                errorText: LocaleKeys.errors_errorPasswordLength.tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}
