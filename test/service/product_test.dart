import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_request_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_response_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/service/login_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/model/product.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/model/product_list.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/model/product_response_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/service/product_service.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/update_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_manager.dart';

void main() {
  setUpAll(() {
    ProductManager.setup();
    ProductItems.networkService.start();
  });

  test('Product List', () async {
    final loginService = LoginService();
    final productService = ProductService();
    final loginResponse =
        await loginService.login<LoginResponseModel, LoginResponseModel>(
      loginModel: LoginRequestModel(
        email: 'alkanatas34@gmail.com',
        password: 'alkan12345',
      ),
      model: LoginResponseModel(),
    );

    if (loginResponse.statusCode == HttpStatus.ok) {
      debugPrint('Login Response ID ${loginResponse.data?.user?.id}');

      final cookie = loginResponse.getCookie(loginResponse.headers);
      final response =
          await productService.getProducts<ProductList, ProductList>(
        cookie: cookie,
        model: ProductList(),
      );
      if (response.statusCode == HttpStatus.ok) {
        debugPrint(
          'Product Response ${response.data?.products?.first.name}',
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

  test('Add Product', () async {
    final loginService = LoginService();
    final productService = ProductService();
    final loginResponse =
        await loginService.login<LoginResponseModel, LoginResponseModel>(
      loginModel: LoginRequestModel(
        email: 'alkanatas34@gmail.com',
        password: 'alkan12345',
      ),
      model: LoginResponseModel(),
    );

    if (loginResponse.statusCode == HttpStatus.ok) {
      debugPrint('Login Response ID ${loginResponse.data?.user?.id}');

      final cookie = loginResponse.getCookie(loginResponse.headers);
      final response = await productService
          .addProduct<ProductResponseModel, ProductResponseModel>(
        cookie: cookie,
        model: ProductResponseModel(),
        product: Product(
          name: 'Test Product1',
          price: 100,
          quantity: 1,
          shopName: 'Test Shop',
        ),
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

  test('Delete Product', () async {
    final loginService = LoginService();
    final productService = ProductService();
    final loginResponse =
        await loginService.login<LoginResponseModel, LoginResponseModel>(
      loginModel: LoginRequestModel(
        email: 'alkanatas34@gmail.com',
        password: 'alkan12345',
      ),
      model: LoginResponseModel(),
    );

    if (loginResponse.statusCode == HttpStatus.ok) {
      debugPrint('Login Response ID ${loginResponse.data?.user?.id}');

      final cookie = loginResponse.getCookie(loginResponse.headers);
      final productList =
          await productService.getProducts<ProductList, ProductList>(
        cookie: cookie,
        model: ProductList(),
      );
      final response = await productService
          .deleteProduct<ProductResponseModel, ProductResponseModel>(
        cookie: cookie,
        model: ProductResponseModel(),
        id: productList.data?.products?.first.id,
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
    final loginResponse =
        await loginService.login<LoginResponseModel, LoginResponseModel>(
      loginModel: LoginRequestModel(
        email: 'alkanatas34@gmail.com',
        password: 'alkan12345',
      ),
      model: LoginResponseModel(),
    );

    if (loginResponse.statusCode == HttpStatus.ok) {
      debugPrint('Login Response ID ${loginResponse.data?.user?.id}');

      final cookie = loginResponse.getCookie(loginResponse.headers);
      final productList =
          await productService.getProducts<ProductList, ProductList>(
        cookie: cookie,
        model: ProductList(),
      );
      final product = productList.data?.products?.first;
      debugPrint(
        'Product Response NetworkStatus: ${product?.id}',
      );
      final response = await productService
          .updateProduct<ProductResponseModel, ProductResponseModel>(
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
