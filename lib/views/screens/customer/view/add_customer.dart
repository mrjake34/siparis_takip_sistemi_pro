import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/colors/colors.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/navigation/navigation_constants.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/core/init/navigation/navigation_service.dart';
import 'package:siparis_takip_sistemi_pro/core/init/translation/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/core/init/utils/utils.dart';
import 'package:siparis_takip_sistemi_pro/providers/customer_provider.dart';
import 'package:siparis_takip_sistemi_pro/src/button/main_elevated_button_without_color.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/customer/bloc/customer_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/customer/model/customer.dart';

class AddCustomer extends StatelessWidget {
  AddCustomer({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  final TextEditingController customerNameController = TextEditingController();

  final TextEditingController customerPhoneController = TextEditingController();

  final TextEditingController customerAddressController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PageBuilder(
      formKey: _formKey,
      customerNameController: customerNameController,
      customerPhoneController: customerPhoneController,
      customerAddressController: customerAddressController,
    );
  }
}

class PageBuilder extends StatelessWidget {
  const PageBuilder({
    required GlobalKey<FormBuilderState> formKey,
    required this.customerNameController,
    required this.customerPhoneController,
    required this.customerAddressController,
    super.key,
  }) : _formKey = formKey;

  final GlobalKey<FormBuilderState> _formKey;
  final TextEditingController customerNameController;
  final TextEditingController customerPhoneController;
  final TextEditingController customerAddressController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.customer_addCustomer.tr(),
        ),
      ),
      body: Column(
        children: [
          const LinearField(),
          Padding(
            padding: const EdgeInsets.all(pagePadding),
            child: FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomerNameTextField(
                      customerNameController: customerNameController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomerPhoneTextField(
                      customerPhoneController: customerPhoneController,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    CustomerAddressTextField(
                      customerAddressController: customerAddressController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const AddCustomerAddLocationWithMapField(),
                    const SizedBox(
                      height: 20,
                    ),
                    AddCustomerAddButtonField(
                      formKey: _formKey,
                      customerNameController: customerNameController,
                      customerPhoneController: customerPhoneController,
                      customerAddressController: customerAddressController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
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

class AddCustomerAddButtonField extends StatelessWidget {
  const AddCustomerAddButtonField({
    required GlobalKey<FormBuilderState> formKey,
    required this.customerNameController,
    required this.customerPhoneController,
    required this.customerAddressController,
    super.key,
  }) : _formKey = formKey;

  final GlobalKey<FormBuilderState> _formKey;
  final TextEditingController customerNameController;
  final TextEditingController customerPhoneController;
  final TextEditingController customerAddressController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<CustomerBloc>().add(
                      AddCustomerEvent(
                        customer: Customer(
                          name: customerNameController.text.trim(),
                          phone: customerPhoneController.text.trim(),
                          address: customerAddressController.text.trim(),
                          latitude: Platform.isWindows == false
                              ? context
                                  .watch<GetUserLocation>()
                                  .getAlternativeMapLatLng2
                                  .latitude
                              : context
                                  .watch<GetUserLocation>()
                                  .getGoogleMapLatLng
                                  .latitude,
                          longitude: Platform.isWindows == false
                              ? context
                                  .watch<GetUserLocation>()
                                  .getAlternativeMapLatLng2
                                  .longitude
                              : context
                                  .watch<GetUserLocation>()
                                  .getGoogleMapLatLng
                                  .longitude,
                        ),
                      ),
                    );
              } else {
                UtilsService.instance.errorSnackBar(
                  LocaleKeys.errors_pleaseEnterAllField.tr(),
                );
              }
            },
            child: Text(LocaleKeys.customer_addCustomer.tr()),
          ),
        )
      ],
    );
  }
}

class AddCustomerAddLocationWithMapField extends StatelessWidget {
  const AddCustomerAddLocationWithMapField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(LocaleKeys.mainText_location.tr()),
          subtitle: SelectableText(
            '${Platform.isWindows == true ? context.watch<GetUserLocation>()
            .getAlternativeMapLatLng2.latitude 
            : context.watch<GetUserLocation>().getGoogleMapLatLng.latitude}',
          ),
        ),
        ListTile(
          title: Text(LocaleKeys.mainText_location.tr()),
          subtitle: SelectableText(
            '${Platform.isWindows == true ? context.watch<GetUserLocation>()
            .getAlternativeMapLatLng2.longitude 
            : context.watch<GetUserLocation>().getGoogleMapLatLng.longitude}',
          ),
        ),
        MainElevatedButtonWithoutColor(
          onPressed: () {
            if (Platform.isWindows) {
              NavigationService.instance
                  .navigateToPage(path: NavigationConstants.customerFlutterMap);
            } else {
              NavigationService.instance
                  .navigateToPage(path: NavigationConstants.customerGoogleMap);
            }
          },
          child: Text(
            LocaleKeys.mainText_chooseLocation.tr(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class CustomerAddressTextField extends StatelessWidget {
  const CustomerAddressTextField({
    required this.customerAddressController,
    super.key,
  });

  final TextEditingController customerAddressController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.disabled,
      controller: customerAddressController,
      keyboardType: TextInputType.streetAddress,
      minLines: 2,
      maxLines: 2,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.maps_home_work),
        labelText: LocaleKeys.customer_customerAddress.tr(),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: LocaleKeys.errors_dontLeaveEmpty.tr(),
        ),
      ]),
    );
  }
}

class CustomerPhoneTextField extends StatelessWidget {
  const CustomerPhoneTextField({
    required this.customerPhoneController,
    super.key,
  });

  final TextEditingController customerPhoneController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.disabled,
      controller: customerPhoneController,
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

class CustomerNameTextField extends StatelessWidget {
  const CustomerNameTextField({
    required this.customerNameController,
    super.key,
  });

  final TextEditingController customerNameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.disabled,
      controller: customerNameController,
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
