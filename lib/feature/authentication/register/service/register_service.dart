import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import '../../../../product/utils/network/network_service.dart';
import '../model/register_request_model.dart';

final class RegisterService {
  RegisterService(NetworkService networkService)
      : _networkService = networkService;
  late final NetworkService _networkService;
  Future<BaseResponseModel<T>> register<T extends IBaseNetworkModel<T>>({
    T? model,
    RegisterRequestModel? data,
  }) async {
    final response = await _networkService.request<T>(
      AppNetwork.signupPath,
      data: data?.toJson(),
      model: model,
      method: MethodType.post,
    );
    return response;
  }
}
