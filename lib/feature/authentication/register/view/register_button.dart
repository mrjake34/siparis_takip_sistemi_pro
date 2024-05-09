part of 'register_page.dart';

final class _RegisterButton extends StatelessWidget {
  const _RegisterButton({
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.shopNameController,
    required this.passwordController,
    required this.password2Controller,
  });

  final GlobalKey<FormBuilderState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController shopNameController;
  final TextEditingController passwordController;
  final TextEditingController password2Controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        if (state.status == Status.isLoading) return const LoadingButton();
        return MainElevatedIconButton(
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              if (state.agreementCheck) {
                context.read<RegisterCubit>().postRegisterModel(
                      data: RegisterRequestModel(
                        name: nameController.text.trim(),
                        email: emailController.text.trim(),
                        phone: phoneController.text.trim(),
                        shopName: shopNameController.text.trim(),
                        password: passwordController.text.trim(),
                      ),
                    );
              } else {
                ProductItems.customSnackBar.errorSnackBar(
                  LocaleKeys.errors_errorUserAgreement.tr(),
                );
              }
            } else {
              ProductItems.customSnackBar.errorSnackBar(
                LocaleKeys.errors_pleaseEnterAllField.tr(),
              );
            }
          },
          label: Text(
            LocaleKeys.mainText_signup.tr(),
          ),
          icon: const Icon(
            Icons.account_circle,
          ),
        );
      },
    );
  }
}
