import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../../../../product/core/constants/strings/appstrings.dart';
import '../../../../../../product/utils/getit/product_items.dart';
import '../../../../../../product/utils/translations/locale_keys.g.dart';
import '../../../../../authentication/login/bloc/login_bloc.dart';
import '../../../bloc/products_bloc.dart';
import '../../../model/product.dart';

final class AddProductButton extends StatelessWidget {
  const AddProductButton({
    required this.formKey,
    required this.productNameController,
    required this.productPriceController,
    super.key,
  });

  final GlobalKey<FormBuilderState> formKey;
  final TextEditingController productNameController;
  final TextEditingController productPriceController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                context.read<ProductsBloc>().add(
                      AddProductEvent(
                        product: Product(
                          name: productNameController.text,
                          price: num.tryParse(productPriceController.text),
                          createdAt: AppStrings.dateTimeNow,
                          shopName:
                              context.read<LoginBloc>().state.model?.shopName,
                          quantity: 1,
                        ),
                      ),
                    );
              } else {
                ProductItems.customSnackBar.errorSnackBar(
                  LocaleKeys.errors_dontLeaveEmpty.tr(),
                );
              }
            },
            child: Text(LocaleKeys.product_addProduct.tr()),
          ),
        ),
      ],
    );
  }
}
