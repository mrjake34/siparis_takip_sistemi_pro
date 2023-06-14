

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:siparis_takip_sistemi_pro/core/base/models/base_model_view.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/views/models/user_model/user.dart';

class ProfileService with BaseModelView {
  Future<User?> fetchUserDetails({String? id, String? cookie}) async {
    cookie ??= sharedManager.getStringValue(PreferenceKey.cookie);
    id ??= sharedManager.getStringValue(PreferenceKey.userId);
    try {
      final response = await networkService.dio.get(
        appNetwork.getUserUrl + id,
        options: Options(
          headers: {
            'authorization': cookie,
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        final jsonUser = response.data;

        final user = User.fromJson(jsonUser as Map<String, String>);

        await sharedManager.setStringValue(PreferenceKey.userId, user.id ?? '');
        await sharedManager.setStringValue(
          PreferenceKey.userName,
          user.name ?? '',
        );
        await sharedManager.setStringValue(
          PreferenceKey.userEmail,
          user.email ?? '',
        );
        await sharedManager.setStringValue(
          PreferenceKey.userPhone,
          user.phone ?? '',
        );
        await sharedManager.setStringValue(
          PreferenceKey.shopName,
          user.shopName ?? '',
        );
        await sharedManager.setStringValue(PreferenceKey.role, user.role ?? '');
        await sharedManager.setBoolValue(
          PreferenceKey.paymentStatus,
          value:user.paymentStatus ?? false,
        );
        await sharedManager.setStringValue(
          PreferenceKey.userUpdatedAt,
          user.updatedAt ?? '',
        );

        return user;
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print('ProfileService Fetch $e');
      }
    }
    return null;
  }

  Future<dynamic> patchUser(String id, String key, String value) async {
    final cookie = sharedManager.getStringValue(PreferenceKey.cookie);
    final response = await networkService.dio.patch(
      appNetwork.getUserUrl + id,
      options: Options(
        headers: {
          'authorization': cookie,
          'Content-Type': 'application/json',
        },
      ),
    );
    if (response.statusCode == 200) {}
  }
}
