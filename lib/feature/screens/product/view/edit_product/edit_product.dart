// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kartal/kartal.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/model/product.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/update_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/colors/colors.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/product/providers/product_providers.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/edit_page_button_field.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';

import '../../bloc/products_bloc.dart';

class EditProduct extends StatefulWidget {
  final String id;
  const EditProduct({required this.id, super.key});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: BlocProvider(
        create: (context) => ProductsBloc(),
        child: Column(
          children: [
            const LinearField(),
            Flexible(
              child: BodyBuilder(
                widget: widget,
                nameController: nameController,
                priceController: priceController,
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
    return BlocBuilder<ProductsBloc, ProductsState>(
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

class BodyBuilder extends StatelessWidget {
  const BodyBuilder({
    required this.widget,
    required this.nameController,
    required this.priceController,
    super.key,
  });

  final EditProduct widget;
  final TextEditingController nameController;
  final TextEditingController priceController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state.productList != null) {
          final product = state.productList?.products
              .firstWhere((element) => element.id == widget.id);
          nameController.text = product?.name ?? '';
          priceController.text = product?.price.toString() ?? '';
          if (product != null) {
            return ListView(
              padding: const EdgeInsets.all(AppSize.pagePadding),
              children: [
                EditProductNameTextField(nameController: nameController),
                const SizedBox(
                  height: 10,
                ),
                EditProductNameButtonField(
                  nameController: nameController,
                  product: product,
                ),
                const SizedBox(
                  height: 10,
                ),
                EditProductPriceTextField(priceController: priceController),
                const SizedBox(
                  height: 10,
                ),
                EditProductPriceButtonField(
                    priceController: priceController, product: product),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        } else if (state.product == null) {
          return Center(
            child: Text(LocaleKeys.errors_failedLoadData.tr()),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}

class EditProductNameTextField extends StatelessWidget {
  const EditProductNameTextField({
    required this.nameController,
    super.key,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: context.watch<EditProductNameEditButtonProvider>().getEditing,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.disabled,
      controller: nameController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.view_in_ar_sharp),
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

class EditProductNameButtonField extends StatelessWidget {
  const EditProductNameButtonField({
    required this.nameController,
    required this.product,
    super.key,
  });

  final TextEditingController nameController;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return EditPageButtonField(
      editingStatus:
          context.watch<EditProductNameEditButtonProvider>().getEditing,
      isEditingFunction: () {
        context.read<EditProductNameEditButtonProvider>().setEditing();
      },
      saveFunction: () {
        if (nameController.text.ext.isNotNullOrNoEmpty) {
          context.read<ProductsBloc>().add(
                EditProductEvent(
                  model: UpdateModel<ProductEnum>(
                    propName: ProductEnum.name,
                    value: nameController.text,
                  ),
                  id: product.id,
                ),
              );
          context.read<EditProductNameEditButtonProvider>().setEditing();
        }
      },
      cancelFunction: () {
        context.read<EditProductNameEditButtonProvider>().setEditing();
      },
    );
  }
}

class EditProductPriceTextField extends StatelessWidget {
  const EditProductPriceTextField({
    required this.priceController,
    super.key,
  });

  final TextEditingController priceController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: context.watch<EditProductPriceEditButtonProvider>().getEditing,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.disabled,
      controller: priceController,
      maxLines: 2,
      minLines: 2,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.currency_lira),
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

class EditProductPriceButtonField extends StatelessWidget {
  const EditProductPriceButtonField({
    required this.priceController,
    required this.product,
    super.key,
  });
  final TextEditingController priceController;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return EditPageButtonField(
      editingStatus: context.watch<ProductsBloc>().state.isEditing ?? false,
      isEditingFunction: () {
        context.read<ProductsBloc>().add(EditProductNameEditButtonEvent());
      },
      saveFunction: () {
        if (priceController.text.ext.isNotNullOrNoEmpty) {
          context.read<ProductsBloc>()
            ..add(
              EditProductEvent(
                model: UpdateModel<ProductEnum>(
                  propName: ProductEnum.price,
                  value: priceController.text,
                ),
                id: product.id,
              ),
            )
            ..add(EditProductNameEditButtonEvent());
        }
      },
      cancelFunction: () {
        context.read<ProductsBloc>().add(EditProductNameEditButtonEvent());
      },
    );
  }
}
