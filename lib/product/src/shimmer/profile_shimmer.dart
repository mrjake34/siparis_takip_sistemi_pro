import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/model/user_model.dart';

import '../../../feature/screens/profile/view/src/index.dart';

final class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: const PageFields(
        user: UserModel(),
      ),
    );
  }
}
