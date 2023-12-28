import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/courier_login/service/courier_login_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_request_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_response_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/service/login_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/model/courier_response_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/service/courier_service.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_manager.dart';

void main() {
  setUpAll(() {
    ProductManager.setup();
    ProductItems.networkService.start();
  });

  test('Courier Login', () async {
    final courierLoginService = CourierLoginService();
    final response =
        await courierLoginService.login<LoginResponseModel, LoginResponseModel>(
      data: LoginRequestModel(
        email: 'alkanatas34@gmail.com',
        password: 'alkan1234',
      ),
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
  test('Courier Get List', () async {
    final loginService = LoginService();
    final courierService = CourierService();
    final response =
        await loginService.login<LoginResponseModel, LoginResponseModel>(
      loginModel: LoginRequestModel(
        email: 'alkanatas34@gmail.com',
        password: 'alkan12345',
      ),
      model: LoginResponseModel(),
    );
    final cookie = response.getCookie(headers: response.headers);
    debugPrint(response.toString());

    if (response.statusCode == HttpStatus.ok) {
      final responseCourier = await courierService
          .getCouriers<CourierResponseModel, CourierResponseModel>(
        cookie: cookie,
        model: CourierResponseModel(),
      );
      if (responseCourier.statusCode == HttpStatus.ok) {
        debugPrint(responseCourier.data?.couriers.toString());
        expect(responseCourier.statusCode == HttpStatus.ok, true);
      } else {
        debugPrint(responseCourier.networkStatus.toString());
        expect(responseCourier.networkStatus != null, true);
      }
    } else {
      debugPrint(response.networkStatus.toString());
      expect(response.networkStatus != null, true);
    }
  });
}
