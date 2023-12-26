part of 'register_page.dart';

final class _PasswordFormField extends StatelessWidget {
  const _PasswordFormField({
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          controller: passwordController,
          textInputAction: TextInputAction.next,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          autofillHints: const [AutofillHints.password],
          obscureText: state.passwordVisibility ?? true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            prefixIcon: const Icon(Icons.lock_outline, size: 20),
            hintText: LocaleKeys.mainText_password.tr(),
            suffixIcon: IconButton(
              icon: Icon(
                state.passwordVisibility == false
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
              onPressed: () {
                context.read<RegisterCubit>().passwordVisibility();
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
