import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/customer/bloc/customer_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/customer/model/customer.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/main_elevated_button.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/main_elevated_button_without_color.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/device_info/device_info.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/snackbar/snackbar.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';

import '../../../../../product/core/constants/colors/colors.dart';
import '../../../../../product/core/constants/enums/enums.dart';
import '../../../../../product/utils/getit/product_items.dart';

part 'add_customer_page_mixin.dart';

@RoutePage()
final class AddCustomerPage extends StatefulWidget {
  const AddCustomerPage({super.key});

  @override
  State<AddCustomerPage> createState() => _AddCustomerPageState();
}

final class _AddCustomerPageState extends State<AddCustomerPage>
    with _AddCustomerPageMixin {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        children: [
          const LinearField(),
          FormBuilder(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomerNameTextField(
                    customerNameController: _customerNameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomerPhoneTextField(
                    customerPhoneController: _customerPhoneController,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  CustomerAddressTextField(
                    customerAddressController: _customerAddressController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AddCustomerAddLocationWithMapField(
                    deviceType: _deviceType,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  AddCustomerAddButtonField(
                    formKey: _formKey,
                    customerNameController: _customerNameController,
                    customerPhoneController: _customerPhoneController,
                    customerAddressController: _customerAddressController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
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
                    latitude: 28.9784,
                    longitude: 41.0082,
                  ),
                ),
              );
        } else {
          CustomSnackBar.errorSnackBar(
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
        const ListTile(
          title: Text('Latitude'),
          subtitle: SelectableText(
            '28.9784',
          ),
        ),
        const ListTile(
          title: Text('Longitude'),
          subtitle: SelectableText(
            '41.0082',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MainElevatedButtonWithoutColor(
              onPressed: () {},
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
