import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';

import '../model/register_request_model.dart';

final class RegisterService {
  Future<BaseResponseModel<T>> register<T extends IBaseNetworkModel<T>>({
    T? model,
    RegisterRequestModel? data,
  }) async {
    final response = await ProductItems.networkService.post<T>(
      AppNetwork.signupPath,
      data: data?.toJson(),
      model: model,
    );
    return response;
  }
}
