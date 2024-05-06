import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import '../../bloc/products_bloc.dart';

import 'index.dart';

@RoutePage()
final class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage>
    with AddProductPageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc(
        productService: ProductItems.productService,
      ),
      child: BaseScaffold(
        body: Column(
          children: [
            FormBuilder(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  ProductNameTextField(
                    productNameController: productNameController,
                  ),
                  ProductPriceTextField(
                    productPriceController: productPriceController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AddProductButton(
                    formKey: formKey,
                    productNameController: productNameController,
                    productPriceController: productPriceController,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
