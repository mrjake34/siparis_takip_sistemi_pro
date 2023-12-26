import 'dart:io';

import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_request_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_response_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';

import '../../../../product/core/constants/enums/network_status.dart';
import '../../../../product/core/constants/network/url.dart';
import '../../../../product/utils/getit/product_items.dart';
import 'interface_login_service.dart';

final class LoginService implements ILoginService {
  @override
  Future<BaseResponseModel<T>> appleLogin<T extends IBaseNetworkModel<T>>() {
    throw UnimplementedError();
  }

  @override
  Future<BaseResponseModel<T>> googleLogin<T extends IBaseNetworkModel<T>>() {
    throw UnimplementedError();
  }

  @override
  Future<BaseResponseModel<T>> login<T extends IBaseNetworkModel<T>>({
    LoginRequestModel? loginModel,
    T? model,
  }) async {
    if (loginModel == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.userNotFound,
        statusCode: HttpStatus.badRequest,
      );
    }
    final response = await ProductItems.networkService.post<LoginResponseModel>(
      AppNetwork.loginPath,
      data: loginModel.toJson(),
      model: LoginResponseModel(),
    );
    if (response.statusCode == HttpStatus.ok) {
      if (response.data == null || response.data == null) {
        return BaseResponseModel(
          networkStatus: NetworkStatus.userNotFound,
          statusCode: response.statusCode,
        );
      } else {
        return BaseResponseModel<T>(
          data: response.data as T?,
          statusCode: response.statusCode,
          headers: response.headers,
        );
      }
    } else {
      return BaseResponseModel<T>(
        networkStatus:
            NetworkStatus.getStatus(response.data!.error?.message ?? ''),
        statusCode: response.statusCode,
      );
    }
  }

  @override
  Future<BaseResponseModel<T>> logout<T extends IBaseNetworkModel<T>>() {
    throw UnimplementedError();
  }
}
