import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/providers/courier_providers.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/edit_page_button_field.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/bloc/courier_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/model/courier.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/service/courier_service.dart';

import '../../../../product/core/constants/colors/colors.dart';
import '../../../../product/core/constants/enums/enums.dart';
import '../../../../product/core/constants/size/sizes.dart';
import '../../../../product/utils/translations/locale_keys.g.dart';

class EditCourier extends StatelessWidget {
  EditCourier({required this.id, super.key});
  final String id;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        children: [
          const LinearField(),
          Flexible(
            child: CourierEditField(
              id: id,
              nameController: nameController,
              emailController: emailController,
              phoneController: phoneController,
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
          return LinearProgressIndicator(
            color: AppColors.instance.alternativeButtonColor,
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
    required this.id,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    super.key,
  });

  final String id;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(pagePadding),
      child: BlocBuilder<CourierBloc, CourierState>(
        builder: (context, state) {
          if (state.courierList != null) {
            final couriers = state.courierList?.couriers
                .firstWhere((element) => element.id == id);
            nameController.text = couriers?.name ?? '';
            emailController.text = couriers?.email ?? '';
            phoneController.text = couriers?.phone ?? '';
            return SingleChildScrollView(
              child: Column(
                children: [
                  EditCourierNameTextField(nameController: nameController),
                  const SizedBox(
                    height: 10,
                  ),
                  EditCourierNameButtonField(
                    nameController: nameController,
                    couriers: couriers,
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
                    couriers: couriers,
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
                    couriers: couriers,
                  ),
                ],
              ),
            );
          } else if (state.courierList == null) {
            return Center(
              child: Text(LocaleKeys.errors_failedLoadData.tr()),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}

class EditCourierPhoneButtonField extends StatelessWidget {
  const EditCourierPhoneButtonField({
    required this.phoneController,
    required this.couriers,
    super.key,
  });

  final TextEditingController phoneController;
  final Courier? couriers;

  @override
  Widget build(BuildContext context) {
    return EditPageButtonField(
      editingStatus: context
          .watch<EditCourierChangePhoneReadyOnlyProvider>()
          .getVisibility,
      isEditingFunction: () {
        context.read<EditCourierChangePhoneReadyOnlyProvider>().setVisibility();
      },
      saveFunction: () {
        CourierService().patchCourier(
          'phone',
          phoneController.text,
          couriers?.phone ?? '',
        );
      },
      cancelFunction: () {
        context.read<EditCourierChangePhoneReadyOnlyProvider>().setVisibility();
      },
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
      readOnly: context
          .watch<EditCourierChangePhoneReadyOnlyProvider>()
          .getVisibility,
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
    required this.couriers,
    super.key,
  });

  final TextEditingController emailController;
  final Courier? couriers;

  @override
  Widget build(BuildContext context) {
    return EditPageButtonField(
      editingStatus: context
          .watch<EditCourierChangeEmailReadyOnlyProvider>()
          .getVisibility,
      isEditingFunction: () {
        context.read<EditCourierChangeEmailReadyOnlyProvider>().setVisibility();
      },
      saveFunction: () {
        CourierService().patchCourier(
          'email',
          emailController.text,
          couriers?.email ?? '',
        );
      },
      cancelFunction: () {
        context.read<EditCourierChangeEmailReadyOnlyProvider>().setVisibility();
      },
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
      readOnly: context
          .watch<EditCourierChangeEmailReadyOnlyProvider>()
          .getVisibility,
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
  final Courier? couriers;

  @override
  Widget build(BuildContext context) {
    return EditPageButtonField(
      editingStatus:
          context.watch<EditCourierChangeNameReadyOnlyProvider>().getVisibility,
      isEditingFunction: () {
        context.read<EditCourierChangeNameReadyOnlyProvider>().setVisibility();
      },
      saveFunction: () {
        CourierService().patchCourier(
          'name',
          nameController.text,
          couriers?.name ?? '',
        );
      },
      cancelFunction: () {
        context.read<EditCourierChangeNameReadyOnlyProvider>().setVisibility();
      },
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
      readOnly:
          context.watch<EditCourierChangeNameReadyOnlyProvider>().getVisibility,
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
