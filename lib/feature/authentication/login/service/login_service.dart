import 'dart:io';

import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_request_model.dart';
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
    Object? loginModel,
    T? model,
  }) async {
    if (loginModel == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.userNotFound,
        statusCode: HttpStatus.badRequest,
      );
    }
    final response = await ProductItems.networkService.post<T>(
      AppNetwork.loginPath,
      data: loginModel,
      model: model,
    );
    return response;
  }

  @override
  Future<BaseResponseModel<T>> logout<T extends IBaseNetworkModel<T>>() {
    throw UnimplementedError();
  }
}
