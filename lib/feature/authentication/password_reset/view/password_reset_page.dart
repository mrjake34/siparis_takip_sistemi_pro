// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kartal/kartal.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/password_reset/cubit/password_reset_cubit.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/main_elevated_icon_button.dart';
import 'package:siparis_takip_sistemi_pro/product/src/dialogs/show_dialog.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';

import '../../../../product/src/button/loading_button.dart';

part 'send_email_button.dart';
part 'email_form_field.dart';

@RoutePage()
class PassResetPage extends StatelessWidget {
  PassResetPage({super.key});

  final TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: BlocProvider(
        create: (context) => PasswordResetCubit(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(AppSize.pagePadding),
                constraints: BoxConstraints(
                  maxWidth: context.general.mediaSize.width >= 800
                      ? 800
                      : context.general.mediaSize.width / 1,
                ),
                child: Form(
                  key: _formKey,
                  child: Card(
                    color: Theme.of(context).colorScheme.surface,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            LocaleKeys.mainText_resetPasswordEmailInfo.tr(),
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          _EmailFormField(emailController: emailController),
                          const SizedBox(
                            height: 5,
                          ),
                          const SizedBox(height: 20),
                          _SendEmailButton(
                            formKey: _formKey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
