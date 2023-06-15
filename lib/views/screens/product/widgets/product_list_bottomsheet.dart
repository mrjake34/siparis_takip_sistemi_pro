import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/colors/colors.dart';
import 'package:siparis_takip_sistemi_pro/core/init/translation/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/product/model/product.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/product/service/product_service.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/product/view/edit_product.dart';

class ProductListBottomSheet extends StatelessWidget {
  const ProductListBottomSheet({super.key, this.product});
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, pageRouterEditProduct());
                },
                child: Text(
                  LocaleKeys.mainText_edit.tr(),
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  openDialog(context);
                },
                child: Text(
                  LocaleKeys.mainText_remove.tr(),
                  style: TextStyle(color: AppColors.instance.removeColor),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }

  MaterialPageRoute<dynamic> pageRouterEditProduct() => MaterialPageRoute(builder: (context) => EditProduct(id: product?.id ?? ''));

  Future<dynamic> openDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            LocaleKeys.mainText_remove.tr(),
            style: const TextStyle(fontSize: 15),
          ),
          content: Text("${LocaleKeys.alerts_productRemove.tr()} ${product?.name ?? ""} ${LocaleKeys.alerts_productRemoveFromProductList.tr()}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(LocaleKeys.mainText_cancel.tr()),
            ),
            TextButton(
              onPressed: () {
                ProductService().deleteProduct(product?.id ?? '', product?.name ?? '').whenComplete(() => Navigator.pop(context));
              },
              child: Text(LocaleKeys.mainText_confirm.tr()),
            ),
          ],
        );
      },
    );
  }
}
