part of 'signup_page.dart';

final class _PageBuilder extends StatelessWidget {
  const _PageBuilder({
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.shopNameController,
    required this.passwordController,
    required this.password2Controller,
    required this.openMembershipAgreement,
    required this.utils,
    required this.state,
  });

  final GlobalKey<FormBuilderState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController shopNameController;
  final TextEditingController passwordController;
  final TextEditingController password2Controller;
  final OpenMembershipAgreement openMembershipAgreement;
  final UtilsService utils;

  final RegisterState state;

  @override
  Widget build(BuildContext context) {
    final pageSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.mainText_signup.tr()),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(pagePadding),
            constraints: BoxConstraints(
              maxWidth: pageSize.width >= 800 ? 800 : pageSize.width / 1,
            ),
            child: FormBuilder(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 10),
                  NameFormField(nameController: nameController),
                  const SizedBox(
                    height: 16,
                  ),
                  EmailFormField(emailController: emailController),
                  const SizedBox(
                    height: 16,
                  ),
                  _PhoneFormField(phoneController: phoneController),
                  const SizedBox(
                    height: 6,
                  ),
                  _ShopNameFormField(shopNameController: shopNameController),
                  const SizedBox(
                    height: 16,
                  ),
                  _PasswordFormField(
                    passwordController: passwordController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  _PasswordTwoFormField(
                    password2Controller: password2Controller,
                  ),
                  const SizedBox(height: 20),
                  _MembershipAgreementField(openMembershipAgreement: openMembershipAgreement),
                  const SizedBox(height: 20),
                  _RegisterButton(
                    formKey: formKey,
                    utils: utils,
                    state: state,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _HaveAccountField(),
                  const Divider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
