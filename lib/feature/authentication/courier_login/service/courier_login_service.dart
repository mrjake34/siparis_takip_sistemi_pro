import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';

import '../../login/model/login_request_model.dart';

final class CourierLoginService {
  Future<BaseResponseModel<T>> login<T extends IBaseNetworkModel<T>>({
    LoginRequestModel? data,
    T? model,
  }) async {
    final response = await ProductItems.networkService.post<T>(
      AppNetwork.courierPath,
      data: data?.toJson(),
      model: model,
    );
    return response;
  }
}
