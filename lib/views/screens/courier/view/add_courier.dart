import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/core/utils/translation/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/core/utils/utils/utils.dart';
import 'package:siparis_takip_sistemi_pro/providers/courier_providers.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/courier/bloc/courier_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/courier/service/courier_service.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/enums/enums.dart';

class AddCourier extends StatefulWidget {
  const AddCourier({super.key});

  @override
  State<AddCourier> createState() => _AddCourierState();
}

class _AddCourierState extends State<AddCourier> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return PageBuilder(
      formKey: _formKey,
      nameController: nameController,
      emailController: emailController,
      phoneController: phoneController,
      passwordController: passwordController,
      password2Controller: password2Controller,
    );
  }
}

class PageBuilder extends StatelessWidget {
  const PageBuilder({
    required GlobalKey<FormBuilderState> formKey,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.password2Controller,
    super.key,
  }) : _formKey = formKey;

  final GlobalKey<FormBuilderState> _formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController password2Controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.courier_addCourier.tr(),
        ),
      ),
      body: Column(
        children: [
          BlocBuilder<CourierBloc, CourierState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              if (state.status == Status.isLoading) {
                return LinearProgressIndicator(
                  color: AppColors.instance.alternativeButtonColor,
                );
              } else {
                return Container();
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(pagePadding),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  AddCourierNameTextField(nameController: nameController),
                  const SizedBox(
                    height: 10,
                  ),
                  AddCourierEmailTextField(emailController: emailController),
                  AddCourierPhoneTextField(phoneController: phoneController),
                  AddCourierPasswordTextField(
                    passwordController: passwordController,
                  ),
                  AddCourierRePasswordTextField(
                    password2Controller: password2Controller,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AddCourierButtonField(
                    formKey: _formKey,
                    passwordController: passwordController,
                    password2Controller: password2Controller,
                    nameController: nameController,
                    emailController: emailController,
                    phoneController: phoneController,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddCourierButtonField extends StatelessWidget {
  const AddCourierButtonField({
    required GlobalKey<FormBuilderState> formKey,
    required this.passwordController,
    required this.password2Controller,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    super.key,
  }) : _formKey = formKey;

  final GlobalKey<FormBuilderState> _formKey;
  final TextEditingController passwordController;
  final TextEditingController password2Controller;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (passwordController.text.trim() ==
                    password2Controller.text.trim()) {
                  CourierService().postCourier(
                    context,
                    nameController.text,
                    emailController.text,
                    passwordController.text,
                    phoneController.text,
                  );
                } else {
                  UtilsService.instance
                      .errorSnackBar(LocaleKeys.errors_passwordDontMatch.tr());
                }
              } else {
                UtilsService.instance
                    .errorSnackBar(LocaleKeys.errors_pleaseEnterAllField.tr());
              }
            },
            child: Text(LocaleKeys.mainText_add.tr()),
          ),
        ),
      ],
    );
  }
}

class AddCourierRePasswordTextField extends StatelessWidget {
  const AddCourierRePasswordTextField({
    required this.password2Controller,
    super.key,
  });

  final TextEditingController password2Controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: password2Controller,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.disabled,
      obscureText: context
          .watch<ChangeRePasswordVisibilityAddCourierProvider>()
          .getVisibility,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        prefixIcon: const Icon(Icons.lock, size: 20),
        labelText: LocaleKeys.mainText_rePassword.tr(),
        suffixIcon: IconButton(
          icon: Icon(
            context
                    .watch<ChangeRePasswordVisibilityAddCourierProvider>()
                    .getVisibility
                ? Icons.visibility_off
                : Icons.visibility,
          ),
          onPressed: () {
            context
                .read<ChangeRePasswordVisibilityAddCourierProvider>()
                .setVisibility();
          },
        ),
      ),
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(
            errorText: LocaleKeys.errors_dontLeaveEmpty.tr(),
          ),
          FormBuilderValidators.minLength(
            6,
            errorText: LocaleKeys.errors_errorPasswordLength.tr(),
          ),
        ],
      ),
    );
  }
}

class AddCourierPasswordTextField extends StatelessWidget {
  const AddCourierPasswordTextField({
    required this.passwordController,
    super.key,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.disabled,
      obscureText: context
          .watch<ChangePasswordVisibilityAddCourierProvider>()
          .getVisibility,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        prefixIcon: const Icon(Icons.lock, size: 20),
        labelText: LocaleKeys.mainText_password.tr(),
        suffixIcon: IconButton(
          icon: Icon(
            context
                    .watch<ChangePasswordVisibilityAddCourierProvider>()
                    .getVisibility
                ? Icons.visibility_off
                : Icons.visibility,
          ),
          onPressed: () {
            context
                .read<ChangePasswordVisibilityAddCourierProvider>()
                .setVisibility();
          },
        ),
      ),
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(
            errorText: LocaleKeys.errors_dontLeaveEmpty.tr(),
          ),
          FormBuilderValidators.minLength(
            6,
            errorText: LocaleKeys.errors_errorPasswordLength.tr(),
          ),
        ],
      ),
    );
  }
}

class AddCourierPhoneTextField extends StatelessWidget {
  const AddCourierPhoneTextField({
    required this.phoneController,
    super.key,
  });

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.disabled,
      controller: phoneController,
      maxLength: 21,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.phone),
        labelText: LocaleKeys.courier_courierPhone.tr(),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: LocaleKeys.errors_dontLeaveEmpty.tr(),
        ),
        FormBuilderValidators.numeric(
          errorText: LocaleKeys.errors_justEnterNumber.tr(),
        )
      ]),
    );
  }
}

class AddCourierEmailTextField extends StatelessWidget {
  const AddCourierEmailTextField({
    required this.emailController,
    super.key,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.disabled,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.mail),
        labelText: LocaleKeys.courier_courierEmail.tr(),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: LocaleKeys.errors_dontLeaveEmpty.tr(),
        ),
        FormBuilderValidators.email(
          errorText: LocaleKeys.errors_justEnterEmail.tr(),
        )
      ]),
    );
  }
}

class AddCourierNameTextField extends StatelessWidget {
  const AddCourierNameTextField({
    required this.nameController,
    super.key,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.disabled,
      controller: nameController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle),
        labelText: LocaleKeys.courier_courierName.tr(),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: LocaleKeys.errors_dontLeaveEmpty.tr(),
        ),
      ]),
    );
  }
}
