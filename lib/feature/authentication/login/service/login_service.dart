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
  Future<BaseResponseModel<R>> appleLogin<R, T extends IBaseNetworkModel<T>>() {
    throw UnimplementedError();
  }

  @override
  Future<BaseResponseModel<R>>
      googleLogin<R, T extends IBaseNetworkModel<T>>() {
    throw UnimplementedError();
  }

  @override
  Future<BaseResponseModel<R>> login<R, T extends IBaseNetworkModel<T>>({
    LoginRequestModel? loginModel,
    T? model,
  }) async {
    if (loginModel == null) {
      return BaseResponseModel<R>(
        networkStatus: NetworkStatus.userNotFound,
        statusCode: HttpStatus.badRequest,
      );
    }
    return ProductItems.networkService.post<R, T>(
      AppNetwork.loginPath,
      data: loginModel.toJson(),
      model: model,
    );
  }

  @override
  Future<BaseResponseModel<R>> logout<R, T extends IBaseNetworkModel<T>>() {
    throw UnimplementedError();
  }
}
