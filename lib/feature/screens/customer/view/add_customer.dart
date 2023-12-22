import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kartal/kartal.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/device_info/device_info.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/main_elevated_button.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/main_elevated_icon_button.dart';
import '../../../../product/core/constants/colors/colors.dart';
import '../../../../product/core/constants/enums/enums.dart';
import '../../../../product/core/constants/navigation/navigation_constants.dart';
import '../../../../product/core/constants/size/sizes.dart';
import '../../../../product/utils/getit/product_items.dart';
import '../../../../product/utils/navigation/navigation_service.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/snackbar/snackbar.dart';
import 'package:siparis_takip_sistemi_pro/product/providers/customer_provider.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/main_elevated_button_without_color.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/customer/bloc/customer_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/customer/model/customer.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController customerPhoneController = TextEditingController();
  final TextEditingController customerAddressController =
      TextEditingController();
  late DeviceType deviceType;

  @override
  void initState() {
    deviceType = ProductItems.deviceInfo.getDeviceType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageBuilder(
      formKey: _formKey,
      customerNameController: customerNameController,
      customerPhoneController: customerPhoneController,
      customerAddressController: customerAddressController,
      deviceType: deviceType,
    );
  }
}

class PageBuilder extends StatelessWidget {
  const PageBuilder({
    required GlobalKey<FormBuilderState> formKey,
    required this.customerNameController,
    required this.customerPhoneController,
    required this.customerAddressController,
    required this.deviceType,
    super.key,
  }) : _formKey = formKey;

  final GlobalKey<FormBuilderState> _formKey;
  final TextEditingController customerNameController;
  final TextEditingController customerPhoneController;
  final TextEditingController customerAddressController;
  final DeviceType deviceType;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
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
                    AddCustomerAddLocationWithMapField(
                      deviceType: deviceType,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(),
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
    return MainElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context.read<CustomerBloc>().add(
                AddCustomerEvent(
                  customer: Customer(
                    name: customerNameController.text.trim(),
                    phone: customerPhoneController.text.trim(),
                    adress: customerAddressController.text.trim(),
                    latitude: context
                        .watch<CustomerMapProvider>()
                        .getPosition
                        .latitude,
                    longitude: context
                        .watch<CustomerMapProvider>()
                        .getPosition
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
    );
  }
}

class AddCustomerAddLocationWithMapField extends StatelessWidget {
  const AddCustomerAddLocationWithMapField({
    required this.deviceType,
    super.key,
  });
  final DeviceType deviceType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Latitude'),
          subtitle: SelectableText(
            context
                .watch<CustomerMapProvider>()
                .getPosition
                .latitude
                .toString(),
          ),
        ),
        ListTile(
          title: const Text('Longitude'),
          subtitle: SelectableText(
            context
                .watch<CustomerMapProvider>()
                .getPosition
                .longitude
                .toString(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MainElevatedButtonWithoutColor(
              onPressed: () {
                if (deviceType == DeviceType.windows) {
                  NavigationService.instance.navigateToPage(
                      path: NavigationConstants.customerFlutterMap);
                } else {
                  NavigationService.instance.navigateToPage(
                      path: NavigationConstants.customerGoogleMap);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_on),
                  Text(LocaleKeys.mainText_chooseLocation.tr()),
                ],
              ),
            ),
          ],
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
