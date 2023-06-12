import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/init/translation/locale_keys.g.dart';
import '../model/product.dart';
import '../service/product_service.dart';
import '../view/edit_product.dart';

class ProductListBottomSheet extends StatelessWidget {
  const ProductListBottomSheet({super.key, this.product});
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EditProduct(id: product?.id ?? "")));
                  },
                  child: Text(
                    LocaleKeys.mainText_edit.tr(),
                    style: const TextStyle(color: Colors.blue),
                  )),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              LocaleKeys.mainText_remove.tr(),
                              style: const TextStyle(fontSize: 15),
                            ),
                            content: Text(
                                "${LocaleKeys.alerts_productRemove.tr()} ${product?.name ?? ""} ${LocaleKeys.alerts_productRemoveFromProductList.tr()}"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(LocaleKeys.mainText_cancel.tr())),
                              TextButton(
                                  onPressed: () {
                                    ProductService()
                                        .deleteProduct(product?.id ?? "",
                                            product?.name ?? "")
                                        .whenComplete(
                                            () => Navigator.pop(context));
                                  },
                                  child:
                                      Text(LocaleKeys.mainText_confirm.tr())),
                            ],
                          );
                        });
                  },
                  child: Text(
                    LocaleKeys.mainText_remove.tr(),
                    style: TextStyle(color: AppColors.instance.removeColor),
                  )),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
