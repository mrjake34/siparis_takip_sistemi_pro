// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:siparis_takip_sistemi_pro/core/base/models/base_model_view.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/navigation/navigation_constants.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/core/init/translation/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/core/init/utils/utils.dart';
import 'package:siparis_takip_sistemi_pro/providers/main_providers.dart';
import 'package:siparis_takip_sistemi_pro/src/button/loading_button.dart';
import 'package:siparis_takip_sistemi_pro/src/button/main_elevated_button.dart';
import 'package:siparis_takip_sistemi_pro/views/authentication/courier_login/cubit/courier_login_page_cubit.dart';

class CourierLoginPage extends StatelessWidget with BaseModelView {
  CourierLoginPage({
    super.key,
  });

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final _loginKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.mainText_title.tr()),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => CourierLoginPageCubit(),
        child: BlocConsumer<CourierLoginPageCubit, CourierLoginPageState>(
          listener: (context, state) {
            if (state.status == Status.isDone) {
              utils.showSnackBar(LocaleKeys.succes_loginSuccess.tr());
              navService.navigateToPageRemoveAll(
                path: NavigationConstants.splashScreen,
              );
            } else if (state.status == UserStatus.userNotFound) {
              utils.errorSnackBar(LocaleKeys.errors_userInfoIncorrect.tr());
            } else {
              utils.errorSnackBar(LocaleKeys.errors_loginError.tr());
            }
          },
          builder: (context, state) {
            return PageBuilder(
              loginKey: _loginKey,
              emailController: emailController,
              passwordController: passwordController,
            );
          },
        ),
      ),
    );
  }
}

class PageBuilder extends StatelessWidget {
  const PageBuilder({
    required GlobalKey<FormBuilderState> loginKey,
    required this.emailController,
    required this.passwordController,
    super.key,
  }) : _loginKey = loginKey;

  final GlobalKey<FormBuilderState> _loginKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final pageSize = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: pageSize.width >= 800 ? 800 : pageSize.width / 1,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FormBuilder(
              key: _loginKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/main-logo.png',
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(pagePadding),
                      child: Column(
                        children: [
                          EmailField(emailController: emailController),
                          const SizedBox(
                            height: 5,
                          ),
                          PasswordField(passwordController: passwordController),
                          const SizedBox(height: 20),
                          CourierLoginButton(
                            loginKey: _loginKey,
                          ),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CourierLoginButton extends StatelessWidget with BaseModelView {
  CourierLoginButton({
    required GlobalKey<FormBuilderState> loginKey,
    super.key,
  }) : _loginKey = loginKey;

  final GlobalKey<FormBuilderState> _loginKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourierLoginPageCubit, CourierLoginPageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.status == Status.isLoading
            ? const LoadingButton()
            : MainElevatedButton(
                onPressed: () {
                  if (_loginKey.currentState!.validate()) {
                    context.read<CourierLoginPageCubit>().loginUser();
                  } else {
                    UtilsService.instance.errorSnackBar(
                      LocaleKeys.errors_pleaseEnterAllField.tr(),
                    );
                  }
                },
                child: Text(
                  LocaleKeys.mainText_courierLogin.tr(),
                ),
              );
      },
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({
    required this.passwordController,
    super.key,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final visibility =
        Provider.of<ChangePasswordVisibilityProvider>(context).getVisibility;
    return TextFormField(
      controller: passwordController,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofillHints: const [AutofillHints.password],
      obscureText: visibility,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        prefixIcon: const Icon(Icons.lock_outline, size: 20),
        hintText: LocaleKeys.mainText_enterPassword.tr(),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
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
            errorText: LocaleKeys.errors_errorEnterPassword.tr(),
          ),
        ],
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({
    required this.emailController,
    super.key,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofillHints: const [AutofillHints.email],
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        prefixIcon: const Icon(
          Icons.mail_outline,
          size: 20,
        ),
        hintText: LocaleKeys.mainText_enterMailAddress.tr(),
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
