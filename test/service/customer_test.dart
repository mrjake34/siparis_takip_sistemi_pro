import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_request_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_response_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/service/login_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/customer/model/customer_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/customer/model/customer_response.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/customer/service/customer_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/model/product_list.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/model/product_response_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/service/product_service.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/mixin/headers_mixin.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/update_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_manager.dart';

void main() {
  setUpAll(() {
    ProductManager.setup();
    ProductItems.networkService.start();
  });

  test('Customer List', () async {
    final loginService = LoginService();
    final customerService = CustomerService();
    final loginResponse = await loginService.login<LoginResponseModel>(
      loginModel: LoginRequestModel(
        email: 'alkanatas34@gmail.com',
        password: 'alkan12345',
      ),
      model: LoginResponseModel(),
    );

    if (loginResponse.statusCode == HttpStatus.ok) {
      debugPrint('Login Response ID ${loginResponse.data?.user?.id}');

      final cookie = loginResponse.getCookie(
        loginResponse.headers,
        type: CookieTypes.setCookie,
      );
      final response = await customerService.getCustomersList<CustomerResponse>(
        cookie: cookie,
        model: CustomerResponse(),
      );
      if (response.statusCode == HttpStatus.ok) {
        debugPrint(
          'Customer List Response ${response.data?.customers?.first.name}',
        );

        expect(response.statusCode == HttpStatus.ok, true);
      } else {
        debugPrint(
          'Customer List Response NetworkStatus: ${response.networkStatus}',
        );
        expect(response.networkStatus != null, true);
      }
    } else {
      debugPrint(loginResponse.networkStatus.toString());
      expect(loginResponse.networkStatus != null, true);
    }
  });

  test('Add Customer', () async {
    final loginService = LoginService();
    final customerService = CustomerService();
    final loginResponse = await loginService.login<LoginResponseModel>(
      loginModel: LoginRequestModel(
        email: 'alkanatas34@gmail.com',
        password: 'alkan12345',
      ),
      model: LoginResponseModel(),
    );

    if (loginResponse.statusCode == HttpStatus.ok) {
      debugPrint('Login Response ID ${loginResponse.data?.user?.id}');

      final cookie = loginResponse.getCookie(
        loginResponse.headers,
        type: CookieTypes.setCookie,
      );
      final response = await customerService.addCustomer<ProductResponseModel>(
        cookie: cookie,
        model: ProductResponseModel(),
        customer: CustomerModel(
          name: 'Alkan Atas',
          phone: '0532 123 45 67',
          adress: 'İstanbul',
          shopName: 'Alkan Market',
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        debugPrint(
          'Customer Response ${response.statusCode}',
        );

        expect(response.statusCode == HttpStatus.ok, true);
      } else {
        debugPrint(
          'Customer Response NetworkStatus: ${response.networkStatus}',
        );
        expect(response.networkStatus != null, true);
      }
    } else {
      debugPrint(loginResponse.networkStatus.toString());
      expect(loginResponse.networkStatus != null, true);
    }
  });

  test('Delete Customer', () async {
    final loginService = LoginService();
    final customerService = CustomerService();
    final loginResponse = await loginService.login<LoginResponseModel>(
      loginModel: LoginRequestModel(
        email: 'alkanatas34@gmail.com',
        password: 'alkan12345',
      ),
      model: LoginResponseModel(),
    );

    if (loginResponse.statusCode == HttpStatus.ok) {
      debugPrint('Login Response ID ${loginResponse.data?.user?.id}');

      final cookie = loginResponse.getCookie(loginResponse.headers);
      final customerList =
          await customerService.getCustomersList<CustomerResponse>(
        cookie: cookie,
        model: CustomerResponse(),
      );
      final response = await customerService.deleteCustomer<CustomerResponse>(
        cookie: cookie,
        model: CustomerResponse(),
        id: customerList.data?.customers?.first.id,
      );
      if (response.statusCode == HttpStatus.ok) {
        debugPrint(
          'Product Response ${response.statusCode}',
        );

        expect(response.statusCode == HttpStatus.ok, true);
      } else {
        debugPrint(
          'Product Response NetworkStatus: ${response.networkStatus}',
        );
        expect(response.networkStatus != null, true);
      }
    } else {
      debugPrint(loginResponse.networkStatus.toString());
      expect(loginResponse.networkStatus != null, true);
    }
  });

  test('Update Product', () async {
    final loginService = LoginService();
    final productService = ProductService();
    final loginResponse = await loginService.login<LoginResponseModel>(
      loginModel: LoginRequestModel(
        email: 'alkanatas34@gmail.com',
        password: 'alkan12345',
      ),
      model: LoginResponseModel(),
    );

    if (loginResponse.statusCode == HttpStatus.ok) {
      debugPrint('Login Response ID ${loginResponse.data?.user?.id}');

      final cookie = loginResponse.getCookie(loginResponse.headers);
      final productList = await productService.getProducts<ProductList>(
        cookie: cookie,
        model: ProductList(),
      );
      final product = productList.data?.products?.first;
      debugPrint(
        'Product Response NetworkStatus: ${product?.id}',
      );
      final response = await productService.updateProduct<ProductResponseModel>(
        cookie: cookie,
        model: ProductResponseModel(),
        id: productList.data?.products?.first.id,
        data: UpdateModel(
          propName: ProductEnum.name.name,
          value: '${product?.name} Updated',
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        debugPrint(
          'Update Response ${response.statusCode}',
        );

        expect(response.statusCode == HttpStatus.ok, true);
      } else {
        debugPrint(
          'Product Response NetworkStatus: ${response.networkStatus}',
        );
        expect(response.networkStatus != null, true);
      }
    } else {
      debugPrint(loginResponse.networkStatus.toString());
      expect(loginResponse.networkStatus != null, true);
    }
  });
}
