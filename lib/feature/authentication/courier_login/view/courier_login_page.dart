// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/courier_login/cubit/courier_login_page_cubit.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/strings/appstrings.dart';
import 'package:siparis_takip_sistemi_pro/product/providers/main_providers.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/loading_button.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/main_elevated_button.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/snackbar/snackbar.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';

import '../../../../product/utils/router/route_manager.dart';

part 'courier_login_page_mixin.dart';

@RoutePage()
class CourierLoginPage extends StatefulWidget {
  const CourierLoginPage({
    super.key,
  });

  @override
  State<CourierLoginPage> createState() => _CourierLoginPageState();
}

class _CourierLoginPageState extends State<CourierLoginPage>
    with CourierLoginPageMixin {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: BlocProvider(
        create: (context) => CourierLoginPageCubit(),
        child: BlocListener<CourierLoginPageCubit, CourierLoginPageState>(
          listener: (context, state) => courierLoginPageListener(state),
          child: PageBuilder(
            loginKey: _loginKey,
            emailController: _emailController,
            passwordController: _passwordController,
          ),
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
    return Center(
      child: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: context.general.mediaSize.width >= 800
                ? 800
                : context.general.mediaSize.width / 1,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FormBuilder(
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
                    height: 20,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSize.pagePadding),
                      child: Column(
                        children: [
                          _EmailField(emailController: emailController),
                          const SizedBox(
                            height: 5,
                          ),
                          _PasswordField(
                              passwordController: passwordController),
                          const SizedBox(height: 20),
                          _CourierLoginButton(
                            loginKey: _loginKey,
                          ),
                          const SizedBox(
                            height: 15,
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
    );
  }
}

final class _CourierLoginButton extends StatelessWidget {
  const _CourierLoginButton({
    required GlobalKey<FormBuilderState> loginKey,
  }) : _loginKey = loginKey;

  final GlobalKey<FormBuilderState> _loginKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourierLoginPageCubit, CourierLoginPageState>(
      builder: (context, state) {
        return state.status == Status.isLoading
            ? const LoadingButton()
            : MainElevatedButton(
                onPressed: () {
                  if (_loginKey.currentState!.validate()) {
                    context.read<CourierLoginPageCubit>().loginUser();
                  } else {
                    CustomSnackBar.errorSnackBar(
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

final class _PasswordField extends StatelessWidget {
  const _PasswordField({
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
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

final class _EmailField extends StatelessWidget {
  const _EmailField({
    required this.emailController,
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
