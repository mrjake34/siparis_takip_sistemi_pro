import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/base/models/base_model_view.dart';
import '../../../../core/constants/enums/enums.dart';
import '../../../../core/singletons/translation/locale_keys.g.dart';
import '../model/courier.dart';

class CourierService with BaseModelView {
  Future<dynamic> postCourier(
    BuildContext context,
    String name,
    String email,
    String password,
    String phone,
  ) async {
    final cookie = sharedManager.getStringValue(PreferenceKey.cookie);
    final response = await networkService.dio.post(
      appNetwork.getCouriersUrl,
      options: Options(
        headers: {
          'content-type': 'application/json',
          'authorization': cookie,
        },
      ),
      data: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      }),
    );
    if (response.statusCode == 200) {
      utils.showSnackBar(LocaleKeys.succes_courierAdded.tr());
      navService.navigateToBack();
    } else if (response.statusCode == 500) {
      utils.errorSnackBar(LocaleKeys.errors_phoneAlreadyExists.tr());
      navService.navigateToBack();
    } else {
      utils.errorSnackBar(LocaleKeys.errors_errorUserRegister.tr());
      navService.navigateToBack();
    }
  }

  Future<CourierList?> getCouriers() async {
    final cookie = sharedManager.getStringValue(PreferenceKey.cookie);
    final response = await networkService.dio.get(
      appNetwork.getCouriersUrl,
      options: Options(
        headers: {
          'content-type': 'application/json',
          'authorization': cookie,
        },
      ),
    );
    if (response.statusCode == 200) {

      final courierList = CourierList.fromJson(
        response.data as Map<String, dynamic>,
      );

      return courierList;
    } else {
      throw Exception('Failed to load orders');
    }
  }

  Future<Courier?> getCourier(String id) async {
    final cookie = sharedManager.getStringValue(PreferenceKey.cookie);
    final response = await networkService.dio.get(
      appNetwork.deleteCourierUrl + id,
      options: Options(
        headers: {
          'content-type': 'application/json',
          'authorization': cookie,
        },
      ),
    );
    if (response.statusCode == 200) {
      final courier = Courier.fromJson(response.data['courier'] as Map<String, String>);
      return courier;
    } else {
      throw Exception('Failed to load orders');
    }
  }

  Future<dynamic> deleteCourier(String id) async {
    final cookie = sharedManager.getStringValue(PreferenceKey.cookie);
    final shopName = sharedManager.getStringValue(PreferenceKey.shopName);
    final response = await networkService.dio.delete(
      appNetwork.deleteCourierUrl + id,
      options: Options(
        headers: {
          'content-type': 'application/json',
          'authorization': cookie,
        },
      ),
      data: {'_id': id, 'shopName': shopName},
    );
    if (response.statusCode == 200) {
      utils.showSnackBar(LocaleKeys.succes_removeSuccessful.tr());
      await getCouriers();
    } else {
      utils.errorSnackBar(LocaleKeys.errors_courierRemoveError.tr());
    }
  }

  Future<dynamic> patchCourier(String key, String value, String id) async {
    final cookie = sharedManager.getStringValue(PreferenceKey.cookie);
    final response = await networkService.dio.patch(
      appNetwork.deleteCourierUrl + id,
      options: Options(
        headers: {
          'content-type': 'application/json',
          'authorization': cookie,
        },
      ),
      data: [
        {'propName': key, 'value': value}
      ],
    );
    if (response.statusCode == 200) {
    } else {}
  }
}
