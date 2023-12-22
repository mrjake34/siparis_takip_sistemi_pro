import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../providers/courier_providers.dart';
import '../../providers/customer_provider.dart';
import '../../providers/main_providers.dart';
import '../../providers/product_providers.dart';
import '../../providers/search_providers.dart';
import '../../providers/theme_providers.dart';
import '../../providers/user_provider.dart';

class AppNotifiers {
  AppNotifiers._init();
  static final AppNotifiers _instance = AppNotifiers._init();
  static AppNotifiers get instance => _instance;

  List<SingleChildWidget> notifierList = [
    ChangeNotifierProvider(create: (context) => OrderDetailProvider()),
    ChangeNotifierProvider(create: (context) => OrderStatusIconProvider()),
    ChangeNotifierProvider(
      create: (context) => OrderStatusBorderColorProvider(),
    ),
    ChangeNotifierProvider(create: (context) => UserDetail()),
    ChangeNotifierProvider(create: (context) => GetUserLocation()),
    ChangeNotifierProvider(
      create: (context) => ChangeCurrencyPriceSymbol(),
    ),
    ChangeNotifierProvider(create: (context) => ThemeChange()),
    ChangeNotifierProvider(create: (context) => CourierSearch()),
    ChangeNotifierProvider(
      create: (context) => AddOrderAddCustomerSearchProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AddOrderAddProductSearchProvider(),
    ),
    ChangeNotifierProvider(create: (context) => CustomerMapProvider()),
    ChangeNotifierProvider(
      create: (context) => ChangePasswordVisibilityProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ChangePasswordVisibilityTwoProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => MembershipAgreementProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AllOrdersListOrderSearchProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => EditProductNameEditButtonProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => EditProductPriceEditButtonProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => CustomerNameEditingStatusProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => CustomerAddressEditingStatusProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => CustomerPhoneEditingStatusProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ChangePasswordVisibilityAddCourierProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ChangeRePasswordVisibilityAddCourierProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => EditCourierChangeNameReadyOnlyProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => EditCourierChangeEmailReadyOnlyProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => EditCourierChangePhoneReadyOnlyProvider(),
    ),
  ];
}
