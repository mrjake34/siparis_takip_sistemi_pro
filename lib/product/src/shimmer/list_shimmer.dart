import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/views/add_order_product_list/add_order_product_list.dart';

import '../../../feature/screens/product/model/product.dart';

final class ListShimmer extends StatelessWidget {
  const ListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ProductCard(product: Product());
        },
        itemCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
