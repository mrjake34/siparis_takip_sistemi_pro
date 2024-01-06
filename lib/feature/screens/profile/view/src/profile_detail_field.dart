import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../product/src/shimmer/profile_shimmer.dart';
import '../../bloc/profile_page_bloc.dart';
import 'index.dart';

final class ProfileDetailField extends StatelessWidget {
  const ProfileDetailField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePageBloc, ProfilePageState>(
      builder: (context, state) {
        if (state.user != null) return PageFields(user: state.user!);
        return const ProfileShimmer();
      },
    );
  }
}
