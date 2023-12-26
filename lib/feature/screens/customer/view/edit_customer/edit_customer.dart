import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/edit_page_button_field.dart';
import '../../../../../product/core/constants/colors/colors.dart';
import '../../../../../product/core/constants/enums/enums.dart';
import '../../../../../product/utils/translations/locale_keys.g.dart';
import '../../bloc/customer_bloc.dart';
import '../../model/customer.dart';

@RoutePage()
final class EditCustomerPage extends StatefulWidget {
  const EditCustomerPage({required this.customer, super.key});
  final Customer? customer;

  @override
  State<EditCustomerPage> createState() => _EditCustomerPageState();
}

class _EditCustomerPageState extends State<EditCustomerPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _addressController;
  late final TextEditingController _phoneController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.customer?.name ?? '');
    _addressController =
        TextEditingController(text: widget.customer?.adress ?? '');
    _phoneController =
        TextEditingController(text: widget.customer?.phone ?? '');
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LinearField(),
            _FormBuilder(
              formKey: _formKey,
              nameController: _nameController,
              customer: widget.customer ?? Customer(),
              addressController: _addressController,
              phoneController: _phoneController,
            ),
          ],
        ),
      ),
    );
  }
}

class _FormBuilder extends StatelessWidget {
  const _FormBuilder({
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required this.customer,
    required TextEditingController addressController,
    required TextEditingController phoneController,
  })  : _formKey = formKey,
        _nameController = nameController,
        _addressController = addressController,
        _phoneController = phoneController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _nameController;
  final Customer customer;
  final TextEditingController _addressController;
  final TextEditingController _phoneController;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          CustomerNameTextField(nameController: _nameController),
          const SizedBox(
            height: 10,
          ),
          CustomerNameButtonField(
            customer: customer,
            nameController: _nameController,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomerAddressTextField(
            addressController: _addressController,
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomerAddressButtonField(),
          const SizedBox(
            height: 10,
          ),
          CustomerPhoneTextField(
            phoneController: _phoneController,
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomerPhoneButtonField(),
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

class CustomerPhoneButtonField extends StatelessWidget {
  const CustomerPhoneButtonField({
    super.key,
  });

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

class CustomerPhoneTextField extends StatelessWidget {
  const CustomerPhoneTextField({
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

class CustomerAddressButtonField extends StatelessWidget {
  const CustomerAddressButtonField({
    super.key,
  });

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

class CustomerAddressTextField extends StatelessWidget {
  const CustomerAddressTextField({
    required this.addressController,
    super.key,
  });

  final TextEditingController addressController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        ),
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
    return EditPageButtonField(
      editingStatus: false,
      isEditingFunction: () {},
      saveFunction: () {},
      cancelFunction: () {},
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
