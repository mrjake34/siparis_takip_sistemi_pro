import 'dart:io';

import 'package:dio/dio.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/model/user_response_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/update_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';

import '../../../../product/core/base/models/network_error_model.dart';
import '../../../../product/core/constants/enums/enums.dart';
import 'interface_profile_service.dart';

final class ProfileService extends IProfileService {
  @override
  Future<BaseResponseModel<T>> getProfile<T extends IBaseNetworkModel<T>>({
    String? cookie,
    String? id,
  }) async {
    if (cookie == null || id == null) {
      return BaseResponseModel(
        error: NetworkStatus.inputsNotFilled.message as NetworkErrorModel?,
      );
    }
    final response = await ProductItems.networkService.get<UserResponseModel>(
      '${AppNetwork.userPath}/$id',
      options: Options(
        headers: {
          'Authorization': 'Bearer $cookie',
        },
      ),
      model: UserResponseModel(),
    );

    if (response.data != null) {
      await ProductItems.sharedManager.setStringValue(
        PreferenceKey.userName,
        response.data!.user!.toJson().toString(),
      );
      return BaseResponseModel(
        data: response.data?.user as T?,
        statusCode: response.statusCode,
      );
    } else {
      return BaseResponseModel(
        error: response.error,
        statusCode: response.statusCode,
      );
    }
  }

  @override
  Future<BaseResponseModel<T>> updateProfile<T extends IBaseNetworkModel<T>>({
    UpdateModel<ProfileEnum>? model,
    String? id,
    String? cookie,
  }) async {
    if (model == null || id == null || cookie == null) {
      return BaseResponseModel(
        error: NetworkStatus.inputsNotFilled.message as NetworkErrorModel?,
      );
    }

    final response = await ProductItems.networkService.put<UserResponseModel>(
      '${AppNetwork.userPath}/$id',
      options: Options(
        headers: {
          'authorization': cookie,
        },
      ),
      data: model.toJson(),
    );
    if (response.data != null) {
      return BaseResponseModel(
        data: NetworkStatus.updateSuccess.message as T?,
        statusCode: response.statusCode,
      );
    } else {
      return BaseResponseModel(
        error: response.error,
        statusCode: response.statusCode,
      );
    }
  }
}
