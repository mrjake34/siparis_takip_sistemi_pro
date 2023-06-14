import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/colors/colors.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/core/init/translation/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/providers/customer_provider.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/customer/bloc/customer_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/customer/model/customer.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/customer/service/customer_service.dart';

class EditCustomer extends StatelessWidget {
  EditCustomer({required this.id, super.key});
  final String id;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PageBuilder(
      id: id,
      nameController: nameController,
      addressController: addressController,
      phoneController: phoneController,
    );
  }
}

class PageBuilder extends StatelessWidget {
  const PageBuilder({
    required this.id,
    required this.nameController,
    required this.addressController,
    required this.phoneController,
    super.key,
  });

  final String id;
  final TextEditingController nameController;
  final TextEditingController addressController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.customer_editCustomer.tr(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LinearField(),
            Padding(
              padding: const EdgeInsets.all(pagePadding),
              child: BlocBuilder<CustomerBloc, CustomerState>(
                builder: (context, state) {
                  if (state.customerList != null) {
                    final customer = state.customerList?.customers
                        ?.firstWhere((element) => element.id == id);
                    nameController.text = customer?.name ?? '';
                    addressController.text = customer?.address ?? '';
                    phoneController.text = customer?.phone ?? '';
                    return Column(
                      children: [
                        CustomerNameTextField(nameController: nameController),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomerNameButtonField(
                          customer: customer,
                          nameController: nameController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomerAddressTextField(
                          addressController: addressController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomerAddressButtonField(),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomerPhoneTextField(
                          phoneController: phoneController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomerPhoneButtonField(),
                      ],
                    );
                  } else if (state.customerList == null) {
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
            ),
          ],
        ),
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
    return BlocBuilder<CustomerBloc, CustomerState>(
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

class CustomerPhoneButtonField extends StatelessWidget {
  const CustomerPhoneButtonField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text(LocaleKeys.mainText_save.tr()),
        ),
        const SizedBox(
          width: 10,
        ),
        if (context
                .watch<CustomerPhoneEditingStatusProvider>()
                .getEditingStatus ==
            true)
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              context
                  .read<CustomerPhoneEditingStatusProvider>()
                  .setEditingStatus();
            },
            child: Text(LocaleKeys.mainText_edit.tr()),
          )
        else
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              context
                  .read<CustomerPhoneEditingStatusProvider>()
                  .setEditingStatus();
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

class CustomerPhoneTextField extends StatelessWidget {
  const CustomerPhoneTextField({
    required this.phoneController,
    super.key,
  });

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly:
          context.watch<CustomerPhoneEditingStatusProvider>().getEditingStatus,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.disabled,
      controller: phoneController,
      maxLength: 21,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.phone),
        labelText: LocaleKeys.customer_customerPhone.tr(),
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

class CustomerAddressButtonField extends StatelessWidget {
  const CustomerAddressButtonField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text(LocaleKeys.mainText_save.tr()),
        ),
        const SizedBox(
          width: 10,
        ),
        if (context
                .watch<CustomerAddressEditingStatusProvider>()
                .getEditingStatus ==
            true)
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              context
                  .read<CustomerAddressEditingStatusProvider>()
                  .setEditingStatus();
            },
            child: Text(LocaleKeys.mainText_edit.tr()),
          )
        else
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              context
                  .read<CustomerAddressEditingStatusProvider>()
                  .setEditingStatus();
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

class CustomerAddressTextField extends StatelessWidget {
  const CustomerAddressTextField({
    required this.addressController,
    super.key,
  });

  final TextEditingController addressController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: context
          .watch<CustomerAddressEditingStatusProvider>()
          .getEditingStatus,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.disabled,
      controller: addressController,
      maxLines: 2,
      minLines: 1,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.location_city),
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

class CustomerNameButtonField extends StatelessWidget {
  const CustomerNameButtonField({
    required this.customer,
    required this.nameController,
    super.key,
  });

  final Customer? customer;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            CustomerService().patchCustomer(
              customer?.name ?? '',
              nameController.text,
              customer?.id ?? '',
            );
          },
          child: Text(LocaleKeys.mainText_save.tr()),
        ),
        const SizedBox(
          width: 10,
        ),
        if (context
                .watch<CustomerNameEditingStatusProvider>()
                .getEditingStatus ==
            true)
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              context
                  .read<CustomerNameEditingStatusProvider>()
                  .setEditingStatus();
            },
            child: Text(LocaleKeys.mainText_edit.tr()),
          )
        else
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              context
                  .read<CustomerNameEditingStatusProvider>()
                  .setEditingStatus();
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

class CustomerNameTextField extends StatelessWidget {
  const CustomerNameTextField({
    required this.nameController,
    super.key,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly:
          context.watch<CustomerNameEditingStatusProvider>().getEditingStatus,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.disabled,
      controller: nameController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle),
        labelText: LocaleKeys.customer_customerName.tr(),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: LocaleKeys.errors_dontLeaveEmpty.tr(),
        ),
      ]),
    );
  }
}
