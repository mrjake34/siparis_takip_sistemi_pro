import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/model/register_request_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/model/register_response_error_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/service/register_service.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_manager.dart';

void main() {
  setUpAll(() {
    ProductManager.setup();
    ProductItems.networkService.start();
  });

  test('Register', () async {
    final registerService = RegisterService();
    final response = await registerService.register<RegisterResponseModel>(
      data: RegisterRequestModel(
        email: 'alkanatas33244@gmail.com',
        password: 'alkan12345',
        name: 'Alkan',
        shopName: 'Atass1',
        phone: '1234567893311',
      ),
      model: RegisterResponseModel(),
    );
    debugPrint(response.toString());
    debugPrint(response.networkStatus.toString());

    if (response.statusCode == HttpStatus.ok) {
      expect(response.statusCode == HttpStatus.ok, true);
    } else {
      expect(response.networkStatus != null, true);
    }
  });
}
