import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../gen/index.dart';
import '../../../../../product/core/constants/enums/enums.dart';
import '../../bloc/products_bloc.dart';

final class LinearField extends StatelessWidget {
  const LinearField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status == Status.isLoading) {
          return const LinearProgressIndicator(
            color: ColorName.alternativeButtonColor,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
