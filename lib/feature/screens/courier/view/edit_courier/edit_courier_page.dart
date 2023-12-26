import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/bloc/courier_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/model/courier_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/edit_page_button_field.dart';
import 'package:siparis_takip_sistemi_pro/product/src/text/failed_load_data_text.dart';

import '../../../../../product/core/constants/colors/colors.dart';
import '../../../../../product/core/constants/enums/enums.dart';
import '../../../../../product/utils/translations/locale_keys.g.dart';

part 'edit_courier_page_mixin.dart';

@RoutePage()
final class EditCourierPage extends StatefulWidget {
  const EditCourierPage({required this.courierModel, super.key});
  final CourierModel courierModel;

  @override
  State<EditCourierPage> createState() => _EditCourierPageState();
}

class _EditCourierPageState extends State<EditCourierPage>
    with EditCourierPageMixin {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        children: [
          const LinearField(),
          Flexible(
            child: CourierEditField(
              courierModel: widget.courierModel,
              nameController: _nameController,
              emailController: _emailController,
              phoneController: _phoneController,
              formKey: _formKey,
            ),
          ),
        ],
      ),
    );
  }
}

class LinearField extends StatelessWidget {
  const LinearField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourierBloc, CourierState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status == Status.isLoading) {
          return const LinearProgressIndicator(
            color: AppColors.alternativeButtonColor,
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class CourierEditField extends StatelessWidget {
  const CourierEditField({
    required this.courierModel,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required GlobalKey<FormBuilderState> formKey,
    super.key,
  }) : _formKey = formKey;

  final CourierModel courierModel;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final GlobalKey<FormBuilderState> _formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourierBloc, CourierState>(
      builder: (context, state) {
        final couriers = state.courierList;
        if (couriers == null) return const FailedLoadDataText();
        final courier = couriers.firstWhere(
          (element) => element.id == courierModel.id,
          orElse: CourierModel.new,
        );
        return SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                EditCourierNameTextField(nameController: nameController),
                const SizedBox(
                  height: 10,
                ),
                EditCourierNameButtonField(
                  nameController: nameController,
                  couriers: courier,
                ),
                const SizedBox(
                  height: 10,
                ),
                EditCourierEmailTextField(emailController: emailController),
                const SizedBox(
                  height: 10,
                ),
                EditCourierEmailButtonField(
                  emailController: emailController,
                  courier: courier,
                ),
                const SizedBox(
                  height: 10,
                ),
                EditCourierPhoneTextField(phoneController: phoneController),
                const SizedBox(
                  height: 10,
                ),
                EditCourierPhoneButtonField(
                  phoneController: phoneController,
                  courier: courier,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class EditCourierPhoneButtonField extends StatelessWidget {
  const EditCourierPhoneButtonField({
    required this.phoneController,
    required this.courier,
    super.key,
  });

  final TextEditingController phoneController;
  final CourierModel courier;

  @override
  Widget build(BuildContext context) {
    return EditPageButtonField(
      editingStatus: false,
      isEditingFunction: () {},
      saveFunction: () {},
      cancelFunction: () {},
    );
  }
}

class EditCourierPhoneTextField extends StatelessWidget {
  const EditCourierPhoneTextField({
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

class EditCourierEmailButtonField extends StatelessWidget {
  const EditCourierEmailButtonField({
    required this.emailController,
    required this.courier,
    super.key,
  });

  final TextEditingController emailController;
  final CourierModel courier;

  @override
  Widget build(BuildContext context) {
    return EditPageButtonField(
      editingStatus: false,
      isEditingFunction: () {},
      saveFunction: () {},
      cancelFunction: () {},
    );
  }
}

class EditCourierEmailTextField extends StatelessWidget {
  const EditCourierEmailTextField({
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
      maxLines: 2,
      minLines: 1,
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

class EditCourierNameButtonField extends StatelessWidget {
  const EditCourierNameButtonField({
    required this.nameController,
    required this.couriers,
    super.key,
  });

  final TextEditingController nameController;
  final CourierModel couriers;

  @override
  Widget build(BuildContext context) {
    return EditPageButtonField(
      editingStatus: false,
      isEditingFunction: () {},
      saveFunction: () {},
      cancelFunction: () {},
    );
  }
}

class EditCourierNameTextField extends StatelessWidget {
  const EditCourierNameTextField({
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
