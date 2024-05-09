import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/bloc/courier_bloc.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';
import '../../../../../gen/index.dart';
import '../../../../../product/core/constants/enums/enums.dart';
import '../../../../../product/utils/getit/product_items.dart';

class AddCourierPage extends StatefulWidget {
  const AddCourierPage({super.key});

  @override
  State<AddCourierPage> createState() => _AddCourierPageState();
}

class _AddCourierPageState extends State<AddCourierPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;
  late final TextEditingController _password2Controller;
  late final GlobalKey<FormBuilderState> _formKey;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        children: [
          BlocBuilder<CourierBloc, CourierState>(
            builder: (context, state) {
              if (state.status == Status.isLoading) {
                return const LinearProgressIndicator(
                  color: ColorName.alternativeButtonColor,
                );
              } else {
                return Container();
              }
            },
          ),
          FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                AddCourierNameTextField(nameController: _nameController),
                const SizedBox(
                  height: 10,
                ),
                AddCourierEmailTextField(emailController: _emailController),
                AddCourierPhoneTextField(phoneController: _phoneController),
                AddCourierPasswordTextField(
                  passwordController: _passwordController,
                ),
                AddCourierRePasswordTextField(
                  password2Controller: _password2Controller,
                ),
                const SizedBox(
                  height: 10,
                ),
                AddCourierButtonField(
                  formKey: _formKey,
                  passwordController: _passwordController,
                  password2Controller: _password2Controller,
                  nameController: _nameController,
                  emailController: _emailController,
                  phoneController: _phoneController,
                ),
              ],
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
                } else {
                  ProductItems.customSnackBar.errorSnackBar(
                    LocaleKeys.errors_passwordDontMatch.tr(),
                  );
                }
              } else {
                ProductItems.customSnackBar.errorSnackBar(
                  LocaleKeys.errors_pleaseEnterAllField.tr(),
                );
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
    return BlocBuilder<CourierBloc, CourierState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: state.isPasswordAgainVisible ?? true,
          controller: password2Controller,
          textInputAction: TextInputAction.done,
          autovalidateMode: AutovalidateMode.disabled,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            prefixIcon: const Icon(Icons.lock, size: 20),
            labelText: LocaleKeys.mainText_rePassword.tr(),
            suffixIcon: IconButton(
              icon: Icon(
                state.isPasswordVisible == false
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
              onPressed: () {
                context
                    .read<CourierBloc>()
                    .add(PasswordAgainVisisbilityEvent());
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
      },
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
    return BlocBuilder<CourierBloc, CourierState>(
      builder: (context, state) {
        return TextFormField(
          controller: passwordController,
          textInputAction: TextInputAction.done,
          autovalidateMode: AutovalidateMode.disabled,
          obscureText: state.isPasswordVisible ?? false,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            prefixIcon: const Icon(Icons.lock, size: 20),
            labelText: LocaleKeys.mainText_password.tr(),
            suffixIcon: IconButton(
              icon: Icon(
                state.isPasswordVisible == false
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
              onPressed: () {
                context.read<CourierBloc>().add(PasswordVisisbilityEvent());
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
      },
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
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(
            errorText: LocaleKeys.errors_dontLeaveEmpty.tr(),
          ),
          FormBuilderValidators.numeric(
            errorText: LocaleKeys.errors_justEnterNumber.tr(),
          ),
        ],
      ),
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
        ),
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
