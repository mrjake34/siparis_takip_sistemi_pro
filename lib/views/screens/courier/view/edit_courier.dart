import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:siparis_takip_sistemi_pro/providers/courier_providers.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/courier/bloc/courier_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/courier/model/courier.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/courier/service/courier_service.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/enums/enums.dart';
import '../../../../core/constants/size/sizes.dart';
import '../../../../core/utils/translation/locale_keys.g.dart';

class EditCourier extends StatelessWidget {
  EditCourier({required this.id, super.key});
  final String id;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.courier_editCourier.tr(),
        ),
      ),
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
            final couriers = state.courierList?.couriers.firstWhere((element) => element.id == id);
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            CourierService().patchCourier(
              'phone',
              phoneController.text,
              couriers?.phone ?? '',
            );
          },
          child: Text(LocaleKeys.mainText_save.tr()),
        ),
        const SizedBox(
          width: 10,
        ),
        if (context.watch<EditCourierChangePhoneReadyOnlyProvider>().getVisibility == true)
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              context.read<EditCourierChangePhoneReadyOnlyProvider>().setVisibility();
            },
            child: Text(LocaleKeys.mainText_edit.tr()),
          )
        else
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              context.read<EditCourierChangePhoneReadyOnlyProvider>().setVisibility();
            },
            child: Text(LocaleKeys.mainText_cancel.tr()),
          ),
        const SizedBox(
          width: 10,
        ),
      ],
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
      readOnly: context.watch<EditCourierChangePhoneReadyOnlyProvider>().getVisibility,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            CourierService().patchCourier(
              'email',
              emailController.text,
              couriers?.email ?? '',
            );
          },
          child: Text(LocaleKeys.mainText_save.tr()),
        ),
        const SizedBox(
          width: 10,
        ),
        if (context.watch<EditCourierChangeEmailReadyOnlyProvider>().getVisibility == true)
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              context.read<EditCourierChangeEmailReadyOnlyProvider>().setVisibility();
            },
            child: Text(LocaleKeys.mainText_edit.tr()),
          )
        else
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              context.read<EditCourierChangeEmailReadyOnlyProvider>().setVisibility();
            },
            child: Text(LocaleKeys.mainText_cancel.tr()),
          ),
        const SizedBox(
          width: 10,
        ),
      ],
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
      readOnly: context.watch<EditCourierChangeEmailReadyOnlyProvider>().getVisibility,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            CourierService().patchCourier('name', nameController.text, couriers?.id ?? '');
          },
          child: Text(LocaleKeys.mainText_save.tr()),
        ),
        const SizedBox(
          width: 10,
        ),
        if (context.watch<EditCourierChangeNameReadyOnlyProvider>().getVisibility == true)
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              context.read<EditCourierChangeNameReadyOnlyProvider>().setVisibility();
            },
            child: Text(LocaleKeys.mainText_edit.tr()),
          )
        else
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              context.read<EditCourierChangeNameReadyOnlyProvider>().setVisibility();
            },
            child: Text(LocaleKeys.mainText_cancel.tr()),
          ),
        const SizedBox(
          width: 10,
        ),
      ],
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
      readOnly: context.watch<EditCourierChangeNameReadyOnlyProvider>().getVisibility,
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
