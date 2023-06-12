// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/colors/colors.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/enums/network_enums.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/core/init/translation/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/product/bloc/products_bloc.dart';

import '../../../../providers/product_providers.dart';
import '../model/product.dart';

class EditProduct extends StatefulWidget {
  final String id;
  const EditProduct({super.key, required this.id});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.product_editProduct.tr(),
        ),
      ),
      body: Column(
        children: [
          const LinearField(),
          Flexible(
            child: BodyBuilder(
                widget: widget,
                nameController: nameController,
                priceController: priceController),
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
    super.key,
    required this.widget,
    required this.nameController,
    required this.priceController,
  });

  final EditProduct widget;
  final TextEditingController nameController;
  final TextEditingController priceController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state.productList != null) {
          Product? product = state.productList?.products
              .firstWhere((element) => element.id == widget.id);
          nameController.text = product?.name ?? "";
          priceController.text = product?.price.toString() ?? "";
          return ListView(
            padding: const EdgeInsets.all(pagePadding),
            children: [
              EditProductNameTextField(nameController: nameController),
              const SizedBox(
                height: 10.0,
              ),
              EditProductNameButtonField(
                  nameController: nameController, product: product),
              const SizedBox(
                height: 10.0,
              ),
              EditProductPriceTextField(priceController: priceController),
              const SizedBox(
                height: 10.0,
              ),
              const EditProductPriceButtonField(),
              const SizedBox(
                height: 10.0,
              ),
            ],
          );
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
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: !context.watch<EditProductNameEditButtonProvider>().getEditing,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.disabled,
      controller: nameController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.view_in_ar_sharp),
        labelText: LocaleKeys.product_productName.tr(),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
            errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
      ]),
    );
  }
}

class EditProductNameButtonField extends StatelessWidget {
  const EditProductNameButtonField({
    super.key,
    required this.nameController,
    required this.product,
  });

  final TextEditingController nameController;
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              context.read<ProductsBloc>().add(EditProductEvent(
                  key: PatchProductEnums.name,
                  value: nameController.text.trim(),
                  id: product?.id));
            },
            child: Text(LocaleKeys.mainText_save.tr())),
        const SizedBox(
          width: 10.0,
        ),
        context.watch<EditProductNameEditButtonProvider>().getEditing == false
            ? ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  context
                      .read<EditProductNameEditButtonProvider>()
                      .setEditing();
                },
                child: Text(LocaleKeys.mainText_edit.tr()))
            : ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  context
                      .read<EditProductNameEditButtonProvider>()
                      .setEditing();
                },
                child: Text(LocaleKeys.mainText_cancel.tr())),
        const SizedBox(
          width: 10.0,
        ),
      ],
    );
  }
}

class EditProductPriceTextField extends StatelessWidget {
  const EditProductPriceTextField({
    super.key,
    required this.priceController,
  });

  final TextEditingController priceController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: !context.watch<EditProductPriceEditButtonProvider>().getEditing,
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
            errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
      ]),
    );
  }
}

class EditProductPriceButtonField extends StatelessWidget {
  const EditProductPriceButtonField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {}, child: Text(LocaleKeys.mainText_save.tr())),
        const SizedBox(
          width: 10.0,
        ),
        context.watch<EditProductPriceEditButtonProvider>().getEditing == false
            ? ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  context
                      .read<EditProductPriceEditButtonProvider>()
                      .setEditing();
                },
                child: Text(LocaleKeys.mainText_edit.tr()))
            : ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  context
                      .read<EditProductPriceEditButtonProvider>()
                      .setEditing();
                },
                child: Text(LocaleKeys.mainText_cancel.tr())),
        const SizedBox(
          width: 10.0,
        ),
      ],
    );
  }
}
