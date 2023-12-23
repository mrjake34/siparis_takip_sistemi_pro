import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'add_product_page.dart';

mixin AddProductPageMixin on State<AddProductPage> {
  late final TextEditingController productNameController;
  late final TextEditingController productPriceController;
  late final GlobalKey<FormBuilderState> formKey;

  @override
  void initState() {
    productNameController = TextEditingController();
    productPriceController = TextEditingController();
    formKey = GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  void dispose() {
    productNameController.dispose();
    productPriceController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }
}
