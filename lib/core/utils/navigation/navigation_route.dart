import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../views/authentication/login/view/login_page.dart';
import '../../../views/authentication/register/view/signup_page.dart';
import '../../../views/other_pages/not_found_page.dart';
import '../../../views/screens/courier/view/add_courier.dart';
import '../../../views/screens/courier/view/courier_list_page.dart';
import '../../../views/screens/courier/view/edit_courier.dart';
import '../../../views/screens/customer/view/add_customer.dart';
import '../../../views/screens/customer/view/customer_list_page.dart';
import '../../../views/screens/customer/view/edit_customer.dart';
import '../../../views/screens/customer/view/maps/customer_flutter_map.dart';
import '../../../views/screens/customer/view/maps/customer_map.dart';
import '../../../views/screens/orders/views/add_customer_in_add_order/add_order_add_customer.dart';
import '../../../views/screens/orders/views/add_order.dart';
import '../../../views/screens/orders/views/order_details/edit_order_details.dart';
import '../../../views/screens/orders/views/order_details/order_detail.dart';
import '../../../views/screens/orders/views/order_lists/order_list_page.dart';
import '../../../views/screens/product/view/add_product.dart';
import '../../../views/screens/product/view/edit_product.dart';
import '../../../views/screens/product/view/product_list.dart';
import '../../../views/screens/profile/view/user_profile.dart';
import '../../../views/screens/splash/view/splash_screen.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationConstants.splashScreen:
        return normalNavigate(SplashScreen(), NavigationConstants.splashScreen);
      case NavigationConstants.userProfile:
        return normalNavigate(
          const UserProfile(),
          NavigationConstants.userProfile,
        );
      case NavigationConstants.registerPage:
        return normalNavigate(
          const SignUpWidget(),
          NavigationConstants.registerPage,
        );
      //Drawer
      case NavigationConstants.orderAddPage:
        return normalNavigate(
          const AddOrder(),
          NavigationConstants.orderAddPage,
        );
      case NavigationConstants.orderListPage:
        return normalNavigate(
          OrderListPage(),
          NavigationConstants.orderListPage,
        );
      //Product
      case NavigationConstants.productAddPage:
        return normalNavigate(
          AddProduct(),
          NavigationConstants.productAddPage,
        );
      case NavigationConstants.productListPage:
        return normalNavigate(
          const ProductListPage(),
          NavigationConstants.productListPage,
        );
      case NavigationConstants.productEditPage:
        return normalNavigate(
          EditProduct(
            id: settings.arguments.toString(),
          ),
          NavigationConstants.productEditPage,
        );
      //Courier
      case NavigationConstants.courierAddPage:
        return normalNavigate(
          const AddCourier(),
          NavigationConstants.courierAddPage,
        );
      case NavigationConstants.courierListPage:
        return normalNavigate(
          const CourierListPage(),
          NavigationConstants.courierListPage,
        );
      case NavigationConstants.courierEditPage:
        return normalNavigate(
          EditCourier(
            id: settings.arguments.toString(),
          ),
          NavigationConstants.courierEditPage,
        );
      //Orders
      case NavigationConstants.orderDetailsPage:
        return normalNavigate(
          const OrderDetails(),
          NavigationConstants.orderDetailsPage,
        );
      case NavigationConstants.orderEditPage:
        return normalNavigate(
          const EditOrderPage(),
          NavigationConstants.orderEditPage,
        );
      case NavigationConstants.orderAddCustomer:
        return normalNavigate(
          const AddOrderAddCustomer(),
          NavigationConstants.orderAddCustomer,
        );
      case NavigationConstants.orderListCompletedOrders:
        return normalNavigate(
          const CourierListPage(),
          NavigationConstants.orderListCompletedOrders,
        );
      case NavigationConstants.orderListOnTheWayOrders:
        return normalNavigate(
          const CustomerListPage(),
          NavigationConstants.orderListOnTheWayOrders,
        );
      case NavigationConstants.orderListPendingOrders:
        return normalNavigate(
          const AddCourier(),
          NavigationConstants.orderListPendingOrders,
        );
      case NavigationConstants.orderListProcessOrders:
        return normalNavigate(
          const CourierListPage(),
          NavigationConstants.orderListProcessOrders,
        );
      //Customer
      case NavigationConstants.customerAddPage:
        return normalNavigate(
          const AddCustomer(),
          NavigationConstants.customerAddPage,
        );
      case NavigationConstants.customerEditPage:
        return normalNavigate(
          EditCustomer(
            id: settings.arguments.toString(),
          ),
          NavigationConstants.customerEditPage,
        );
      case NavigationConstants.customerListPage:
        return normalNavigate(
          const CustomerListPage(),
          NavigationConstants.customerListPage,
        );
      case NavigationConstants.customerFlutterMap:
        return normalNavigate(
          const AddCustomerFlutterMap(),
          NavigationConstants.customerFlutterMap,
        );
      case NavigationConstants.customerGoogleMap:
        return normalNavigate(
          const AddCustomerGoogleMap(),
          NavigationConstants.customerGoogleMap,
        );
      //Authentication
      case NavigationConstants.loginPage:
        return normalNavigate(
          LoginPage(),
          NavigationConstants.loginPage,
        );
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => const NotFoundPage(),
        );
    }
  }

  PageRouteBuilder<dynamic> normalNavigate(
    Widget widget,
    String pageName, {
    Object? object,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, duration, animation) => widget,
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      settings: RouteSettings(name: pageName, arguments: object),
    );
  }
}
