part of 'signup_page.dart';

final class _PhoneFormField extends StatelessWidget {
  const _PhoneFormField({
    required this.phoneController,
  });

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: phoneController,
      maxLength: 21,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofillHints: const [AutofillHints.telephoneNumber],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        prefixIcon: const Icon(
          Icons.phone_outlined,
          size: 20,
        ),
        hintText: LocaleKeys.mainText_enterPhoneNumber.tr(),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: LocaleKeys.errors_dontLeaveEmpty.tr(),
        ),
      ]),
    );
  }
}
