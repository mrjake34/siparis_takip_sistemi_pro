import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';

import '../../../../product/utils/network/network_service.dart';
import '../../login/model/login_request_model.dart';

final class CourierLoginService {
  CourierLoginService(NetworkService networkService)
      : _networkService = networkService;
  late final NetworkService _networkService;
  Future<BaseResponseModel<T>> login<T extends IBaseNetworkModel<T>>({
    LoginRequestModel? data,
    T? model,
  }) async {
    final response = await _networkService.request<T>(
      AppNetwork.courierPath,
      data: data?.toJson(),
      model: model,
      method: MethodType.post,
    );
    return response;
  }
}
