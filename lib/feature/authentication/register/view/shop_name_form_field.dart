part of 'register_page.dart';

final class _ShopNameFormField extends StatelessWidget {
  const _ShopNameFormField({
    required this.shopNameController,
  });

  final TextEditingController shopNameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: shopNameController,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofillHints: const [AutofillHints.organizationName],
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        prefixIcon: const Icon(
          Icons.person_outline_outlined,
          size: 20,
        ),
        hintText: LocaleKeys.profile_shopName.tr(),
      ),
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(
            errorText: LocaleKeys.errors_dontLeaveEmpty.tr(),
          ),
        ],
      ),
    );
  }
}
