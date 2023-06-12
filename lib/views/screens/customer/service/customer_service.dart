
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/base/models/base_model_view.dart';
import '../../../../core/constants/network/url.dart';
import '../../../../core/constants/enums/enums.dart';
import '../../../../core/init/translation/locale_keys.g.dart';
import '../model/customer.dart';

class CustomerService with BaseModelView {
  Future<Response?> addCustomer({Customer? customer}) async {
    String? cookie = sharedManager.getStringValue(PreferenceKey.cookie);
    final response = await networkService.dio.post(
      appNetwork.getCustomerUrl,
      options: Options(headers: {
        "content-type": "application/json",
        "authorization": cookie,
      }),
      data: {
        "name": customer?.name,
        "phone": customer?.phone,
        "adress": customer?.address,
        "latitude": customer?.latitude,
        "longitude": customer?.longitude
      },
    );
    return response;
  }

  Future<CustomerList?> getCustomersList() async {
    String? cookie = sharedManager.getStringValue(PreferenceKey.cookie);
    final response = await networkService.dio.get(appNetwork.getCustomerUrl,
        options: Options(
          headers: {
            "content-type": "application/json",
            "authorization": cookie
          },
        ));
    if (response.statusCode == 200) {
      CustomerList customer = CustomerList.fromJson(response.data);
      return customer;
    } else {
      throw Exception("Failed to load customer list");
    }
  }

  Future<Customer> getCustomer(String id) async {
    String? cookie = sharedManager.getStringValue(PreferenceKey.cookie);
    final response =
        await networkService.dio.get(appNetwork.deleteCustomerUrl + id,
            options: Options(
              headers: {
                "content-type": "application/json",
                "authorization": cookie
              },
            ));
    Customer customer = Customer.fromJson(response.data["customer"]);
    return customer;
  }

  Future patchCustomer(String key, String value, String id) async {
    String? cookie = sharedManager.getStringValue(PreferenceKey.cookie);

    final response = await networkService.dio.patch(
        appNetwork.deleteCustomerUrl + id,
        options: Options(headers: {
          "content-type": "application/json",
          "authorization": cookie
        }),
        data: [
          {"propName": key, "value": value}
        ]);
    if (kDebugMode) {
      print(response.statusCode);
    }
  }

  Future deleteCustomer(String id) async {
    String? cookie = sharedManager.getStringValue(PreferenceKey.cookie);
    final response =
        await networkService.dio.delete(appNetwork.deleteCustomerUrl + id,
            options: Options(
              headers: {
                "content-type": "application/json",
                "authorization": cookie
              },
            ));
    if (response.statusCode == 200) {
      utils.showSnackBar(LocaleKeys.succes_removeSuccessful.tr());
    } else if (response.statusCode == 401) {
      try {
        //MainFunctions().refreshToken();
      } catch (e) {
        utils.errorSnackBar(LocaleKeys.errors_tokenError.tr());
      }
    } else {
      utils.errorSnackBar(LocaleKeys.errors_customerRemoveError.tr());
    }
  }
}
