import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../../product/core/base/models/base_model_view.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/model/user.dart';

class ProfileService with BaseModelView {
  Future<UserModel?> fetchUserDetails({String? cookie}) async {
    cookie ??= sharedManager.getStringValue(PreferenceKey.cookie);
    final id = sharedManager.getStringValue(PreferenceKey.userId);
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
        final user = UserModel.fromJson(response.data as Map<String, dynamic>);
        await sharedManager.setStringValue(
          PreferenceKey.userName,
          user.user.name ?? '',
        );
        await sharedManager.setStringValue(
          PreferenceKey.userEmail,
          user.user.email ?? '',
        );
        await sharedManager.setStringValue(
          PreferenceKey.userPhone,
          user.user.phone ?? '',
        );
        await sharedManager.setStringValue(
          PreferenceKey.shopName,
          user.user.shopName ?? '',
        );
        await sharedManager.setStringValue(
          PreferenceKey.role,
          user.user.role ?? '',
        );
        await sharedManager.setBoolValue(
          PreferenceKey.paymentStatus,
          value: user.user.paymentStatus ?? false,
        );
        await sharedManager.setStringValue(
          PreferenceKey.userUpdatedAt,
          user.user.updatedAt.toString(),
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
