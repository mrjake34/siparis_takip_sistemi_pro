import 'package:siparis_takip_sistemi_pro/feature/authentication/register/model/register_request_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/model/register_response_error_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';

final class RegisterService {
  Future<BaseResponseModel<T>> register<T extends IBaseNetworkModel<T>>({
    RegisterRequestModel? model,
  }) async {
    final response =
        await ProductItems.networkService.post<RegisterResponseErrorModel>(
      AppNetwork.signupPath,
      data: model?.toJson(),
      model: RegisterResponseErrorModel(),
    );
    return BaseResponseModel(
      error: response.error,
    );
  }
}
