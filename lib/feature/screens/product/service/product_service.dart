import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import '../../../../product/core/base/models/base_model_view.dart';
import '../../../../product/core/constants/enums/enums.dart';
import '../../../../product/core/constants/enums/network_status.dart';
import '../../../../product/utils/translations/locale_keys.g.dart';
import '../model/product.dart';

class ProductService with BaseModelView {
  Future<ProductList?> fetchProductList() async {
    final cookie = sharedManager.getStringValue(PreferenceKey.cookie);
    final response = await networkService.dio.get(
      appNetwork.productUrl,
      options: Options(
        headers: {
          'content-type': 'application/json',
          'authorization': cookie,
        },
      ),
    );

    if (response.statusCode == 200) {
      final productList =
          ProductList.fromJson(response.data as Map<String, dynamic>);
      return productList;
    } else {
      utils.errorSnackBar(LocaleKeys.errors_failedLoadData.tr());
    }
    return null;
  }

  Future<dynamic> deleteProduct(String id) async {
    final cookie = sharedManager.getStringValue(PreferenceKey.cookie);
    final response = await networkService.dio.delete(
      appNetwork.productUrlWithSlash + id,
      options: Options(
        headers: {
          'content-type': 'application/json',
          'authorization': cookie,
        },
      ),
    );
    if (response.statusCode == 200) {
      utils.showSnackBar(LocaleKeys.succes_removeSuccessful.tr());
      //fetchProductList();
    } else {
      utils.errorSnackBar(LocaleKeys.errors_productRemoveError.tr());
    }
  }

  Future<Response<dynamic>?> addProduct(String name, double price) async {
    final cookie = sharedManager.getStringValue(PreferenceKey.cookie);

    final response = await networkService.dio.post(
      appNetwork.productUrl,
      options: Options(
        headers: {
          'content-type': 'application/json',
          'authorization': cookie,
        },
      ),
      data: {
        'name': name,
        'price': price,
      },
    );

    return response;
  }

  Future<Product> getProduct(String id) async {
    final cookie = sharedManager.getStringValue(PreferenceKey.cookie);

    final response = await networkService.dio.get(
      appNetwork.productUrlWithSlash + id,
      options: Options(
        headers: {
          'content-type': 'application/json',
          'authorization': cookie,
        },
      ),
    );
    if (kDebugMode) {
      print(response.data);
    }
    final product =
        Product.fromJson(response.data['product'] as Map<String, dynamic>);

    return product;
  }

  Future<Response<dynamic>?> patchProduct({
    PatchProductEnums? key,
    String? value,
    String? id,
  }) async {
    final cookie = sharedManager.getStringValue(PreferenceKey.cookie);
    if (id != null && value != null) {
      final response = await ProductItems.networkService
          .put<BaseResponseModel<NetworkStatus>>(
        '${AppNetwork.productPath}/$id',
        data: [
          {'propName': key.toString(), 'value': value},
        ],
        options: Options(
          headers: {
            'content-type': 'application/json',
            'authorization': cookie,
          },
        ),
      );
      return response;
    } else {
      return null;
    }
  }
}
