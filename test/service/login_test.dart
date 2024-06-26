import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_request_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_response_model.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_manager.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/network/network_service.dart';

void main() {
  setUpAll(() {
    ProductManager.setup();
    NetworkService.start();
  });

  test('Login', () async {
    final loginService = ProductItems.loginService;
    final response = await loginService.login<LoginResponseModel>(
      loginModel: LoginRequestModel(
        email: 'alkanatas34@gmail.com',
        password: 'alkan12345',
      ).toJson(),
      model: LoginResponseModel(),
    );
    debugPrint(response.toString());

    if (response.statusCode == HttpStatus.ok) {
      debugPrint(response.data?.user?.id);
      expect(response.statusCode == HttpStatus.ok, true);
    } else {
      debugPrint(response.networkStatus.toString());
      expect(response.networkStatus != null, true);
    }
  });
}
