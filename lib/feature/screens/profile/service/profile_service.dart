import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/update_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/network/network_service.dart';
import 'package:vexana/vexana.dart';
import 'interface_profile_service.dart';

final class ProfileService extends IProfileService {
  ProfileService(NetworkService networkService)
      : _networkService = networkService;
  late final NetworkService _networkService;
  @override
  Future<BaseResponseModel<T>> getProfile<T extends IBaseNetworkModel<T>>({
    String? cookie,
    String? id,
    T? model,
  }) async {
    if (cookie == null || id == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
      );
    }
    final response = await _networkService.request<T>(
      '${AppNetwork.userPath}$id',
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      method: MethodType.get,
      model: model,
    );
    return response;
  }

  @override
  Future<BaseResponseModel<T>> updateProfile<T extends IBaseNetworkModel<T>>({
    UpdateModel? model,
    String? id,
    String? cookie,
  }) async {
    if (model == null || id == null || cookie == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
      );
    }

    final response = await _networkService.request<T>(
      '${AppNetwork.userPath}$id',
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      method: MethodType.put,
      data: model.toJson(),
    );
    return BaseResponseModel(
      data: response.data,
      statusCode: response.statusCode,
      networkStatus: response.networkStatus,
      headers: response.headers,
    );
  }
}
