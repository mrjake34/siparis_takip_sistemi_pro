import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kartal/kartal.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/bloc/login_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/service/login_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/service/profile_service.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/strings/appstrings.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/loading_button.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/main_elevated_button.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/router/route_manager.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/snackbar/snackbar.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';

import '../model/login_request_model.dart';

part 'login_page_mixin.dart';
part 'courier_login_page_router_button.dart';
part 'forget_password_text.dart';
part 'login_button.dart';
part 'email_form_field.dart';
part 'password_form_field.dart';
part 'register_text.dart';

@RoutePage()
final class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final class _LoginPageState extends State<LoginPage> with _LoginPageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        loginService: LoginService(),
        profileService: ProfileService(),
      ),
      child: BaseScaffold(
        appBar: false,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: _maxWidth(context),
              ),
              child: _FormBuilder(
                loginKey: _loginKey,
                emailController: _emailController,
                passwordController: _passwordController,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final class _FormBuilder extends StatelessWidget {
  const _FormBuilder({
    required GlobalKey<FormBuilderState> loginKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _loginKey = loginKey,
        _emailController = emailController,
        _passwordController = passwordController;

  final GlobalKey<FormBuilderState> _loginKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _loginKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            AppStrings.mainLogoPath,
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
                  _EmailFormField(
                    emailController: _emailController,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  _PasswordFormField(
                    passwordController: _passwordController,
                  ),
                  const SizedBox(height: 20),
                  _LoginButton(
                    loginKey: _loginKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                  ),
                  const SizedBox(height: 15),
                  const _ForgetPasswordText(),
                  const _RegisterText(),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  const _CourierLoginPageRouterButton(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
