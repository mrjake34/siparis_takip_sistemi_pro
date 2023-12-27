part of 'password_reset_page.dart';

final class _EmailFormField extends StatelessWidget {
  const _EmailFormField({
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      textInputAction: TextInputAction.done,
      autofillHints: const [AutofillHints.email],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        prefixIcon: const Icon(
          Icons.mail_outline,
          size: 20,
        ),
        hintText: LocaleKeys.mainText_enterMailAddress.tr(),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface.withOpacity(0.1),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: LocaleKeys.errors_dontLeaveEmpty.tr(),
        ),
        FormBuilderValidators.email(
          errorText: LocaleKeys.errors_justEnterEmail.tr(),
        ),
      ]),
    );
  }
}
