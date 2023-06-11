import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/enums/network_enums.dart';
import '../../../../core/base/models/base_model_view.dart';
import '../../../../core/constants/enums/enums.dart';
import '../../../../core/init/translation/locale_keys.g.dart';
import '../model/product.dart';

class ProductService with BaseModelView {
  Future<ProductList?> fetchProductList() async {
    String? cookie = sharedManager.getStringValue(PreferenceKey.cookie);
    final response = await networkService.dio.get(
      appConstats.productUrl,
      options: Options(headers: {
        "content-type": "application/json",
        "authorization": cookie,
      }),
    );

    if (response.statusCode == 200) {
      final productList = ProductList.fromJson(response.data);
      return productList;
    } else {
      utils.errorSnackBar(LocaleKeys.errors_failedLoadData.tr());
    }
    return null;
  }

  Future deleteProduct(String id, String name) async {
    String? cookie = sharedManager.getStringValue(PreferenceKey.cookie);
    final response =
        await networkService.dio.delete(appConstats.productUrlWithSlash + id,
            options: Options(
              headers: {
                "content-type": "application/json",
                "authorization": cookie,
              },
            ));
    if (response.statusCode == 200) {
      utils.showSnackBar(LocaleKeys.succes_removeSuccessful.tr());
      //fetchProductList();
    } else {
      utils.errorSnackBar(LocaleKeys.errors_productRemoveError.tr());
    }
  }

  Future<Response?> addProduct(String name, double price) async {
    String? cookie = sharedManager.getStringValue(PreferenceKey.cookie);

    final response = await networkService.dio.post(
      appConstats.productUrl,
      options: Options(headers: {
        "content-type": "application/json",
        "authorization": cookie,
      }),
      data: {
        'name': name,
        'price': price,
      },
    );

    return response;
  }

  Future<Product> getProduct(String id) async {
    String? cookie = sharedManager.getStringValue(PreferenceKey.cookie);

    final response = await networkService.dio.get(
      appConstats.productUrlWithSlash + id,
      options: Options(
        headers: {
          "content-type": "application/json",
          "authorization": cookie,
        },
      ),
    );
    if (kDebugMode) {
      print(response.data);
    }
    Product product = Product.fromJson(response.data["product"]);

    return product;
  }

  Future<Response?> patchProduct(
      {PatchProductEnums? key, String? value, String? id}) async {
    String? cookie = sharedManager.getStringValue(PreferenceKey.cookie);
    if (id != null && value != null) {
      final response = await networkService.dio.patch(
        appConstats.productUrlWithSlash + id,
        data: [
          {"propName": key.toString(), "value": value}
        ],
        options: Options(
          headers: {
            "content-type": "application/json",
            "authorization": cookie,
          },
        ),
      );
      return response;
    } else {
      return null;
    }
  }
}
