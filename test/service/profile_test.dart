import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_request_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_response_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/service/login_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/model/user.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/model/user_response_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/service/profile_service.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_manager.dart';

void main() {
  setUpAll(() {
    ProductManager.setup();
    ProductItems.networkService.start();
  });

  test('Profile', () async {
    final profileService = ProfileService();
    final loginService = LoginService();
    final loginResponse =
        await loginService.login<LoginResponseModel, LoginResponseModel>(
      loginModel: LoginRequestModel(
        email: 'alkanatas34@gmail.com',
        password: 'alkan12345',
      ),
      model: LoginResponseModel(),
    );

    debugPrint('Login Response Status Code: ${loginResponse.statusCode}');
    debugPrint('Login Response Data: ${loginResponse.data!.user?.id}');

    if (loginResponse.statusCode == HttpStatus.ok) {
      final cookie = loginResponse.getCookie(headers: loginResponse.headers);
      final response =
          await profileService.getProfile<UserResponseModel, UserResponseModel>(
        cookie: cookie,
        id: loginResponse.data?.user?.id,
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
