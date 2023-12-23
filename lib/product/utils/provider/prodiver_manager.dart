import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../feature/authentication/login/bloc/login_bloc.dart';
import '../../../feature/screens/courier/bloc/courier_bloc.dart';
import '../../../feature/screens/customer/bloc/customer_bloc.dart';
import '../../../feature/screens/orders/bloc/add_order_bloc/orders_bloc.dart';
import '../../../feature/screens/product/bloc/products_bloc.dart';
import '../../../feature/screens/profile/bloc/user_profile_bloc.dart';

class ProviderManager extends StatelessWidget {
  const ProviderManager({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CustomerBloc(),
        ),
        BlocProvider(
          create: (context) => CourierBloc(),
        ),
        BlocProvider(
          create: (context) => OrdersBloc(),
        ),
        BlocProvider(
          create: (context) => ProductsBloc(),
        ),
        BlocProvider(
          create: (context) => UserProfileBloc(),
        ),
      ],
      child: child,
    );
  }
}
