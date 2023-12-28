import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/model/register_request_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/model/register_response_model.dart';
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
    final response = await registerService
        .register<RegisterResponseModel, RegisterResponseModel>(
      data: RegisterRequestModel(
        email: 'alkanatas1333244@gmail.com',
        password: 'alkan12345',
        name: 'Alkan',
        shopName: 'A2tasss1',
        phone: '12345647893s311',
      ),
      model: RegisterResponseModel(),
    );
    debugPrint(response.statusCode.toString());
    if (response.statusCode == HttpStatus.ok) {
      debugPrint(response.data?.message);
      expect(response.statusCode == HttpStatus.ok, true);
    } else {
      debugPrint(response.networkStatus.toString());
      expect(response.networkStatus != null, true);
    }
  });
}
