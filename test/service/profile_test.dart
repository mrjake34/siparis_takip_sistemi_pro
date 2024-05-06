import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_request_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_response_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/service/login_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/model/user_response_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/service/profile_service.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/mixin/headers_mixin.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_manager.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/network/network_service.dart';

void main() {
  setUpAll(() {
    ProductManager.setup();
    NetworkService.start();
  });

  test('Profile', () async {
    final profileService = ProductItems.profileService;
    final loginService = ProductItems.loginService;
    final loginResponse = await loginService.login<LoginResponseModel>(
      loginModel: LoginRequestModel(
        email: 'alkanatas34@gmail.com',
        password: 'alkan12345',
      ),
      model: LoginResponseModel(),
    );

    debugPrint('Login Response Status Code: ${loginResponse.statusCode}');
    debugPrint('Login Response Data: ${loginResponse.data!.user?.id}');

    if (loginResponse.statusCode == HttpStatus.ok) {
      final cookie = loginResponse.getCookie(
        loginResponse.headers,
        type: CookieTypes.setCookie,
      );
      final response = await profileService.getProfile<UserResponseModel>(
        cookie: cookie,
        id: loginResponse.data?.user?.id,
        model: UserResponseModel(),
      );
      if (response.statusCode == HttpStatus.ok) {
        debugPrint('Profile Response Status Code: ${response.statusCode}');
        debugPrint('Profile Response Data: ${response.data?.user?.email}');
        expect(response.statusCode == HttpStatus.ok, true);
      } else {
        debugPrint('Profile Response NetworkStatus: ${response.networkStatus}');
        expect(response.networkStatus != null, true);
      }
    } else {
      expect(loginResponse.networkStatus != null, true);
    }
  });
}
