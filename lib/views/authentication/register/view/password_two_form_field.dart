part of 'signup_page.dart';

final class _PasswordTwoFormField extends StatelessWidget {
  const _PasswordTwoFormField({
    required this.password2Controller,
  });

  final TextEditingController password2Controller;

  @override
  Widget build(BuildContext context) {
    final visibility = Provider.of<ChangePasswordVisibilityTwoProvider>(context).getVisibility;
    return TextFormField(
      controller: password2Controller,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofillHints: const [AutofillHints.password],
      obscureText: visibility,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        prefixIcon: const Icon(Icons.lock_outline, size: 20),
        hintText: LocaleKeys.mainText_rePassword.tr(),
        suffixIcon: IconButton(
          icon: Icon(
            visibility == false ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            if (visibility == true) {
              context.read<ChangePasswordVisibilityTwoProvider>().setVisibility = false;
            } else {
              context.read<ChangePasswordVisibilityTwoProvider>().setVisibility = true;
            }
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
  }
}
