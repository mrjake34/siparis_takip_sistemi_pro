import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_request_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_response_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/service/login_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/model/register_request_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/model/register_response_error_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/service/register_interface.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_manager.dart';

void main() {
  setUpAll(() {
    ProductManager.setup();
    ProductItems.networkService.start();
  });

  test('Register', () async {
    final registerService = RegisterService();
    final response = await registerService.register<RegisterResponseErrorModel>(
      data: RegisterRequestModel(
        email: 'alkanatas34@gmail.com',
        password: 'alkan1234',
        name: 'Alkan',
        shopName: 'Atas',
        phone: '123456789',
      ),
      model: RegisterResponseErrorModel(),
    );
    debugPrint(response.toString());
    debugPrint(response.error?.message ?? '');

    expect(response.data?.message != null, true);
  });
}
