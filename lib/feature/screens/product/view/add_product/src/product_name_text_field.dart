import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../../product/utils/translations/locale_keys.g.dart';

final class ProductNameTextField extends StatelessWidget {
  const ProductNameTextField({
    required this.productNameController,
    super.key,
  });

  final TextEditingController productNameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.disabled,
      controller: productNameController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.view_in_ar),
        labelText: LocaleKeys.product_productName.tr(),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: LocaleKeys.errors_dontLeaveEmpty.tr(),
        ),
      ]),
    );
  }
}
