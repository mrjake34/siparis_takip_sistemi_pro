import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kartal/kartal.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/bloc/login_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/model/product.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/strings/appstrings.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/snackbar/snackbar.dart';
import '../../../../product/core/constants/colors/colors.dart';
import '../../../../product/core/constants/enums/enums.dart';
import '../../../../product/utils/translations/locale_keys.g.dart';
import '../bloc/products_bloc.dart';

class AddProduct extends StatelessWidget {
  AddProduct({super.key});
  final TextEditingController productNameController = TextEditingController();

  final TextEditingController productPriceController = TextEditingController();

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return PageBuilder(
        formKey: _formKey,
        productNameController: productNameController,
        productPriceController: productPriceController);
  }
}

class PageBuilder extends StatelessWidget {
  const PageBuilder({
    required GlobalKey<FormBuilderState> formKey,
    required this.productNameController,
    required this.productPriceController,
    super.key,
  }) : _formKey = formKey;

  final GlobalKey<FormBuilderState> _formKey;
  final TextEditingController productNameController;
  final TextEditingController productPriceController;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        children: [
          const LinearField(),
          FormBuilder(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(AppSize.pagePadding),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  ProductNameTextField(
                      productNameController: productNameController),
                  ProductPriceTextField(
                      productPriceController: productPriceController),
                  const SizedBox(
                    height: 10,
                  ),
                  AddProductButton(
                    formKey: _formKey,
                    productNameController: productNameController,
                    productPriceController: productPriceController,
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
    return BlocProvider(
      create: (context) => ProductsBloc(),
      child: BlocBuilder<ProductsBloc, ProductsState>(
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
      ),
    );
  }
}

class AddProductButton extends StatelessWidget {
  const AddProductButton({
    required GlobalKey<FormBuilderState> formKey,
    required this.productNameController,
    required this.productPriceController,
    super.key,
  }) : _formKey = formKey;

  final GlobalKey<FormBuilderState> _formKey;
  final TextEditingController productNameController;
  final TextEditingController productPriceController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<ProductsBloc>().add(
                      AddProductEvent(
                        product: Product(
                          name: productNameController.text,
                          price: productPriceController.text,
                          createdAt: AppStrings.dateTimeNow,
                          shopName: context
                                  .read<LoginBloc>()
                                  .state
                                  .model
                                  ?.user
                                  .shopName ??
                              '',
                          quantity: 1,
                        ),
                      ),
                    );
              } else {
                CustomSnackBar.errorSnackBar(
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

class ProductPriceTextField extends StatelessWidget {
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
            errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
      ]),
    );
  }
}

class ProductNameTextField extends StatelessWidget {
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
            errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
      ]),
    );
  }
}
