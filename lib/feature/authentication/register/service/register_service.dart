import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';

import '../model/register_request_model.dart';
import '../model/register_response_model.dart';

final class RegisterService {
  Future<BaseResponseModel<T>> register<T extends IBaseNetworkModel<T>>({
    T? model,
    RegisterRequestModel? data,
  }) async {
    final response =
        await ProductItems.networkService.post<RegisterResponseModel>(
      AppNetwork.signupPath,
      data: data?.toJson(),
      model: RegisterResponseModel(),
    );
    return BaseResponseModel(
      statusCode: response.statusCode,
      networkStatus: NetworkStatus.getStatus(response.data?.message ?? ''),
    );
  }
}
