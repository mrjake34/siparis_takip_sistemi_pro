// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/core/init/utils/utils.dart';
import 'package:siparis_takip_sistemi_pro/providers/main_providers.dart';
import 'package:siparis_takip_sistemi_pro/src/button/loading_button.dart';
import 'package:siparis_takip_sistemi_pro/src/button/main_elevated_icon_button.dart';
import 'package:siparis_takip_sistemi_pro/src/dialogs/show_dialog.dart';

import '../../../../core/base/models/base_model_view.dart';
import '../../../../core/constants/app/main_funcs.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/translation/locale_keys.g.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_state.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> with BaseModelView {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();
  final MainFuncs mainFunction = MainFuncs();
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
        nameController: nameController,
        phoneController: phoneController,
        emailController: emailController,
        shopNameController: shopNameController,
        passwordController: passwordController,
        password2Controller: password2Controller,
        formKey: formKey,
      ),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state.status == Status.isFailed) {
            utils.errorSnackBar(LocaleKeys.errors_errorUserRegister.tr());
          } else if (state.status == Status.isDone) {
            navService.navigateToPageRemoveAll(
                path: NavigationConstants.loginPage);
            CustomDialog().showCustomDialog(
                context, Text(LocaleKeys.succes_registerSuccess.tr()));
          }
        },
        builder: (context, state) {
          return PageBuilder(
              formKey: formKey,
              nameController: nameController,
              emailController: emailController,
              phoneController: phoneController,
              shopNameController: shopNameController,
              passwordController: passwordController,
              password2Controller: password2Controller,
              mainFunctions: mainFunction,
              utils: utils,
              state: state);
        },
      ),
    );
  }
}

class PageBuilder extends StatelessWidget {
  const PageBuilder({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.shopNameController,
    required this.passwordController,
    required this.password2Controller,
    required this.mainFunctions,
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
  final MainFuncs mainFunctions;
  final UtilsService utils;

  final RegisterState state;

  @override
  Widget build(BuildContext context) {
    Size pageSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.mainText_signup.tr()),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(pagePadding),
            constraints: BoxConstraints(
                maxWidth: pageSize.width >= 800 ? 800 : pageSize.width / 1),
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
                  PhoneFormField(phoneController: phoneController),
                  const SizedBox(
                    height: 6,
                  ),
                  ShopNameFormField(shopNameController: shopNameController),
                  const SizedBox(
                    height: 16,
                  ),
                  PasswordFormField(
                    passwordController: passwordController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  PasswordTwoFormField(
                    password2Controller: password2Controller,
                  ),
                  const SizedBox(height: 20),
                  MembershipAgreementField(mainFunctions: mainFunctions),
                  const SizedBox(height: 20),
                  RegisterButton(
                    formKey: formKey,
                    utils: utils,
                    state: state,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  HaveAccountField(),
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

class HaveAccountField extends StatelessWidget with BaseModelView {
  HaveAccountField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.mainText_haveAccount.tr(),
        ),
        TextButton(
            onPressed: () {
              navService.navigateToBack();
            },
            child: Text(LocaleKeys.mainText_login.tr(),
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Theme.of(context).colorScheme.error,
                )))
      ],
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.formKey,
    required this.utils,
    required this.state,
  });

  final GlobalKey<FormBuilderState> formKey;
  final UtilsService utils;
  final RegisterState state;

  @override
  Widget build(BuildContext context) {
    final agreement =
        Provider.of<MembershipAgreementProvider>(context).getAgreement;
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: state.status == Status.isLoading
              ? const LoadingButton()
              : MainElevatedIconButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      if (agreement == true) {
                        context.read<RegisterCubit>().postRegisterModel();
                      } else {
                        utils.errorSnackBar(
                            LocaleKeys.errors_errorUserAgreement.tr());
                      }
                    } else {
                      utils.errorSnackBar(
                          LocaleKeys.errors_pleaseEnterAllField.tr());
                    }
                  },
                  label: Text(
                    LocaleKeys.mainText_signup.tr(),
                  ),
                  icon: const Icon(
                    Icons.account_circle,
                  ),
                ),
        ),
      ],
    );
  }
}

class MembershipAgreementField extends StatelessWidget {
  const MembershipAgreementField({
    super.key,
    required this.mainFunctions,
  });

  final MainFuncs mainFunctions;

  @override
  Widget build(BuildContext context) {
    final agreement =
        Provider.of<MembershipAgreementProvider>(context).getAgreement;
    return Row(
      children: [
        Checkbox(
            checkColor: Theme.of(context).colorScheme.background,
            value: agreement,
            onChanged: (bool? newValue) {
              context.read<MembershipAgreementProvider>().setAgreement =
                  newValue!;
            }),
        TextButton(
            onPressed: () {
              mainFunctions.openMembershipAgreement();
            },
            child: Text(LocaleKeys.mainText_userAgreement.tr())),
      ],
    );
  }
}

class PasswordTwoFormField extends StatelessWidget {
  const PasswordTwoFormField({
    super.key,
    required this.password2Controller,
  });

  final TextEditingController password2Controller;

  @override
  Widget build(BuildContext context) {
    final visibility =
        Provider.of<ChangePasswordVisibilityTwoProvider>(context).getVisibility;
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
              context
                  .read<ChangePasswordVisibilityTwoProvider>()
                  .setVisibility = false;
            } else {
              context
                  .read<ChangePasswordVisibilityTwoProvider>()
                  .setVisibility = true;
            }
          },
        ),
      ),
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(
              errorText: LocaleKeys.errors_errorEnterPassword.tr()),
          FormBuilderValidators.minLength(6,
              errorText: LocaleKeys.errors_errorPasswordLength.tr()),
        ],
      ),
    );
  }
}

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final visibility =
        Provider.of<ChangePasswordVisibilityProvider>(context).getVisibility;
    return TextFormField(
      controller: passwordController,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofillHints: const [AutofillHints.password],
      obscureText: visibility,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        prefixIcon: const Icon(Icons.lock_outline, size: 20),
        hintText: LocaleKeys.mainText_password.tr(),
        suffixIcon: IconButton(
          icon: Icon(
            visibility == false ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            if (visibility == true) {
              context.read<ChangePasswordVisibilityProvider>().setVisibility =
                  false;
            } else {
              context.read<ChangePasswordVisibilityProvider>().setVisibility =
                  true;
            }
          },
        ),
      ),
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(
              errorText: LocaleKeys.errors_errorEnterPassword.tr()),
          FormBuilderValidators.minLength(6,
              errorText: LocaleKeys.errors_errorPasswordLength.tr()),
        ],
      ),
    );
  }
}

class ShopNameFormField extends StatelessWidget {
  const ShopNameFormField({
    super.key,
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
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
            errorText: LocaleKeys.errors_dontLeaveEmpty.tr())
      ]),
    );
  }
}

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({
    super.key,
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
            errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
      ]),
    );
  }
}

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    super.key,
    required this.emailController,
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
            errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
        FormBuilderValidators.email(
            errorText: LocaleKeys.errors_justEnterEmail.tr())
      ]),
    );
  }
}

class NameFormField extends StatelessWidget {
  const NameFormField({
    super.key,
    required this.nameController,
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
            errorText: LocaleKeys.errors_dontLeaveEmpty.tr())
      ]),
    );
  }
}
