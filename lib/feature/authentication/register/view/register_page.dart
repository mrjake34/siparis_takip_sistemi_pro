import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/cubit/register_cubit.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/cubit/register_state.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/app/open_membership_agreement.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/loading_button.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/main_elevated_icon_button.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/router/route_manager.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';
import '../../../../product/core/base/view/base_scaffold.dart';
import '../model/register_request_model.dart';
part 'have_account_field.dart';
part 'membership_agreement_field.dart';
part 'password_form_field.dart';
part 'password_two_form_field.dart';
part 'phone_form_field.dart';
part 'register_button.dart';
part 'shop_name_form_field.dart';
part 'register_page_mixin.dart';

@RoutePage()
final class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final class _RegisterPageState extends State<RegisterPage>
    with RegisterPageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(ProductItems.registerService),
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) => _registerListener(state),
        child: _PageField(
          formKey: _formKey,
          nameController: _nameController,
          emailController: _emailController,
          phoneController: _phoneController,
          shopNameController: _shopNameController,
          passwordController: _passwordController,
          password2Controller: _password2Controller,
        ),
      ),
    );
  }
}

final class _PageField extends StatelessWidget {
  const _PageField({
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
    final pageSize = MediaQuery.of(context).size;
    return BaseScaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
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
                  _PasswordFormField(passwordController: passwordController),
                  const SizedBox(
                    height: 16,
                  ),
                  _PasswordTwoFormField(
                    password2Controller: password2Controller,
                  ),
                  const SizedBox(height: 20),
                  const _MembershipAgreementField(),
                  const SizedBox(height: 20),
                  _RegisterButton(
                    formKey: formKey,
                    nameController: nameController,
                    emailController: emailController,
                    phoneController: phoneController,
                    shopNameController: shopNameController,
                    passwordController: passwordController,
                    password2Controller: password2Controller,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const _HaveAccountField(),
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

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    required this.emailController,
    super.key,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofillHints: const [AutofillHints.email],
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        prefixIcon: const Icon(
          Icons.mail_outline,
          size: 20,
        ),
        hintText: LocaleKeys.mainText_enterMailAddress.tr(),
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

class NameFormField extends StatelessWidget {
  const NameFormField({
    required this.nameController,
    super.key,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofillHints: const [AutofillHints.name],
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        prefixIcon: const Icon(
          Icons.person_outline_outlined,
          size: 20,
        ),
        hintText: LocaleKeys.mainText_enterName.tr(),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: LocaleKeys.errors_dontLeaveEmpty.tr(),
        ),
      ]),
    );
  }
}
