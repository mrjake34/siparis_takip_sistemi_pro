import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../../product/utils/translations/locale_keys.g.dart';

final class ProductPriceTextField extends StatelessWidget {
  const ProductPriceTextField({
    required this.productPriceController,
    super.key,
  });

  final TextEditingController productPriceController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.disabled,
      keyboardType: TextInputType.number,
      controller: productPriceController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.money),
        labelText: LocaleKeys.product_productPrice.tr(),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: LocaleKeys.errors_dontLeaveEmpty.tr(),
        ),
      ]),
    );
  }
}
