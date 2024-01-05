import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/home_page/view/home_page.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: const HomePage(),
    );
  }
}
