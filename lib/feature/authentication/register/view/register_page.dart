import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/cubit/register_cubit.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/cubit/register_state.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/app/open_membership_agreement.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/navigation/navigation_constants.dart';
import 'package:siparis_takip_sistemi_pro/product/providers/main_providers.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/loading_button.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/main_elevated_icon_button.dart';
import 'package:siparis_takip_sistemi_pro/product/src/dialogs/show_dialog.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';

import '../../../../product/core/base/view/base_scaffold.dart';

part 'have_account_field.dart';
part 'membership_agreement_field.dart';
part 'page_builder.dart';
part 'password_form_field.dart';
part 'password_two_form_field.dart';
part 'phone_form_field.dart';
part 'register_button.dart';
part 'shop_name_form_field.dart';

@RoutePage()
final class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();
  final OpenMembershipAgreement openMembershipAgreement =
      OpenMembershipAgreement();
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state.status == Status.isFailed) {
            utils.errorSnackBar(LocaleKeys.errors_errorUserRegister.tr());
          } else if (state.status == Status.isDone) {
            navService.navigateToPageRemoveAll(
              path: NavigationConstants.loginPage,
            );
            CustomDialog().showCustomDialog(
              context,
              Text(LocaleKeys.succes_registerSuccess.tr()),
            );
          }
        },
        builder: (context, state) {
          return _PageBuilder(
            formKey: formKey,
            nameController: nameController,
            emailController: emailController,
            phoneController: phoneController,
            shopNameController: shopNameController,
            passwordController: passwordController,
            password2Controller: password2Controller,
            openMembershipAgreement: openMembershipAgreement,
            state: state,
          );
        },
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
