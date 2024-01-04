// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kartal/kartal.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/courier_login/cubit/courier_login_page_cubit.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/courier_login/service/courier_login_service.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/strings/appstrings.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/loading_button.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/main_elevated_button.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/snackbar/snackbar.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';

import '../../../../product/utils/router/route_manager.dart';

part 'courier_login_page_mixin.dart';
part 'courier_login_button.dart';
part 'email_field.dart';
part 'main_logo_field.dart';
part 'password_field.dart';
part 'login_page_router_button.dart';

@RoutePage()
final class CourierLoginPage extends StatefulWidget {
  const CourierLoginPage({
    super.key,
  });

  @override
  State<CourierLoginPage> createState() => _CourierLoginPageState();
}

final class _CourierLoginPageState extends State<CourierLoginPage>
    with CourierLoginPageMixin {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: false,
      body: BlocProvider(
        create: (context) => CourierLoginPageCubit(
          courierLoginService: CourierLoginService(),
        ),
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
          child: FormBuilder(
            key: _loginKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const _MainLogoField(),
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
                          passwordController: passwordController,
                        ),
                        const SizedBox(height: 20),
                        _CourierLoginButton(
                          loginKey: _loginKey,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Divider(),
                        const _LoginPageRouterButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
