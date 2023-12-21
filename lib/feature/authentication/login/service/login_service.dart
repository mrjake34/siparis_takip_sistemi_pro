import 'dart:io';

import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_request_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_response_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/network_error_model.dart';

import '../../../../product/core/constants/enums/network_status.dart';
import '../../../../product/core/constants/network/url.dart';
import '../../../../product/utils/getit/product_items.dart';
import '../../../screens/profile/model/user.dart';
import '../../../screens/profile/service/profile_service.dart';
import 'interface_login_service.dart';

final class LoginService implements ILoginService {
  @override
  Future<BaseResponseModel<T>> appleLogin<T extends IBaseNetworkModel<T>>() {
    // TODO: implement appleLogin
    throw UnimplementedError();
  }

  @override
  Future<BaseResponseModel<T>> googleLogin<T extends IBaseNetworkModel<T>>() {
    // TODO: implement googleLogin
    throw UnimplementedError();
  }

  @override
  Future<BaseResponseModel<T>> login<T extends IBaseNetworkModel<T>>({
    LoginRequestModel? loginModel,
  }) async {
    if (loginModel == null) {
      return BaseResponseModel<T>(
        data: NetworkStatus.userNotFound.message as T?,
        statusCode: HttpStatus.badRequest,
      );
    }

    final response = await ProductItems.networkService.post<LoginResponseModel>(
      AppNetwork.loginPath,
      data: loginModel.toJson(),
      model: LoginResponseModel(),
    );

    if (response.statusCode == HttpStatus.ok) {
      final user = await ProfileService().getProfile<BaseResponseModel<User>>(
        cookie: response.getCookie(headers: response.headers),
        id: response.data?.user?.id,
      );
      return BaseResponseModel<T>(
        data: user.data as T?,
        statusCode: response.statusCode,
      );
    } else if (response.statusCode == HttpStatus.badRequest) {
      return BaseResponseModel<T>(
        error: NetworkErrorModel.getStatus(
          NetworkStatus.userNotFound.message!,
        ) as NetworkErrorModel?,
        statusCode: response.statusCode,
      );
    }
    return BaseResponseModel<T>(
      error: NetworkStatus.userNotFound.message as NetworkErrorModel?,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<BaseResponseModel<T>> logout<T extends IBaseNetworkModel<T>>() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
