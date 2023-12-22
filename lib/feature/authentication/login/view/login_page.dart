// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/courier_login/view/courier_login.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/bloc/login_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/password_reset/view/passport_reset.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/product/providers/main_providers.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/loading_button.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/main_elevated_button.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/router/route_manager.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/snackbar/snackbar.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';

import '../model/login_request_model.dart';

@RoutePage()
final class LoginPage extends StatelessWidget {
  LoginPage({
    super.key,
  });

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final loginKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BaseScaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: context.general.mediaSize.width >= 800
                    ? 800
                    : context.general.mediaSize.width / 1,
              ),
              child: FormBuilder(
                key: loginKey,
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
                      width: 50,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            EmailFormField(
                              emailController: emailController,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            PasswordFormField(
                              passwordController: passwordController,
                            ),
                            const SizedBox(height: 20),
                            LoginButton(
                              loginKey: loginKey,
                              emailController: emailController,
                              passwordController: passwordController,
                            ),
                            const SizedBox(height: 15),
                            const ForgetPasswordText(),
                            const RegisterText(),
                            const Divider(),
                            const SizedBox(
                              height: 20,
                            ),
                            const CourierLoginPageRouterButton(),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
      autofillHints: const [AutofillHints.email],
      controller: emailController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
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

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    required this.passwordController,
    super.key,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final visibility =
        Provider.of<ChangePasswordVisibilityProvider>(context).getVisibility;

    return TextFormField(
      autofillHints: const [AutofillHints.password],
      controller: passwordController,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: visibility,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        prefixIcon: const Icon(
          Icons.lock_outline,
          size: 20,
        ),
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

class LoginButton extends StatelessWidget {
  const LoginButton({
    required this.loginKey,
    required this.emailController,
    required this.passwordController,
    super.key,
  });
  final GlobalKey<FormBuilderState> loginKey;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == Status.isFailed) {
          CustomSnackBar.errorSnackBar(state.errorMessage);
        } else if (state.status == Status.isDone) {
          context.router.replaceNamed(RoutePath.homeScreen.path);
        }
      },
      builder: (context, state) {
        if (state.status == Status.isLoading) {
          return const LoadingButton();
        } else {
          return MainElevatedButton(
            onPressed: () {
              if (loginKey.currentState?.validate() ?? false) {
                context.read<LoginBloc>().add(UserLoginEvent(
                      model: LoginRequestModel(
                        email: emailController?.text,
                        password: passwordController?.text,
                      ),
                    ));
              } else {
                CustomSnackBar.errorSnackBar(
                  LocaleKeys.errors_pleaseEnterAllField.tr(),
                );
              }
            },
            child: Text(
              LocaleKeys.mainText_login.tr(),
            ),
          );
        }
      },
    );
  }
}

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        LocaleKeys.mainText_forgetPassword.tr(),
        style: TextStyle(
          color: Theme.of(context).colorScheme.error,
          fontSize: 15,
        ),
      ),
      onPressed: () => Navigator.of(context).push(pageRouterPassReset()),
    );
  }

  MaterialPageRoute<dynamic> pageRouterPassReset() {
    return MaterialPageRoute(
      builder: (context) => PassReset(),
    );
  }
}

class RegisterText extends StatelessWidget {
  const RegisterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(LocaleKeys.mainText_haventAccount.tr()),
        TextButton(
          onPressed: () {
            context.router.replaceNamed(RoutePath.registerScreen.path);
          },
          child: Text(LocaleKeys.mainText_signup.tr()),
        ),
      ],
    );
  }
}

class CourierLoginPageRouterButton extends StatelessWidget {
  const CourierLoginPageRouterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: MainElevatedButton(
            onPressed: () {
              Navigator.push(context, pageRouterCourierLoginPage());
            },
            child: Text(LocaleKeys.mainText_courierLogin.tr()),
          ),
        ),
      ],
    );
  }

  MaterialPageRoute<dynamic> pageRouterCourierLoginPage() {
    return MaterialPageRoute(builder: (context) => CourierLoginPage());
  }
}
