import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/bloc/login_bloc.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/provider/theme/theme_cubit.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import '../../../feature/screens/orders/bloc/add_order/orders_bloc.dart';

class ProviderManager extends StatelessWidget {
  const ProviderManager({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OrdersBloc(ProductItems.orderService),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
            profileService: ProductItems.profileService,
            loginService: ProductItems.loginService,
          ),
        ),
      ],
      child: child,
    );
  }
}
