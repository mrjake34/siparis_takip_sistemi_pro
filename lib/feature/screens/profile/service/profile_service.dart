import 'package:dio/dio.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/update_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';

import '../../../../product/core/constants/enums/enums.dart';
import '../model/user.dart';
import 'interface_profile_service.dart';

final class ProfileService extends IProfileService {
  @override
  Future<BaseResponseModel<T>> getProfile<T>({String? cookie}) async {
    cookie ??= ProductItems.sharedManager.getStringValue(PreferenceKey.cookie);
    final id = ProductItems.sharedManager.getStringValue(PreferenceKey.userId);
    try {
      final response =
          await ProductItems.networkService.get<BaseResponseModel<UserModel>>(
        '${AppNetwork.userPath}/$id',
        options: Options(
          headers: {
            'authorization': cookie,
          },
        ),
      );

      if (response.statusCode == 200) {
        if (response.data == null) {
          return BaseResponseModel(
            data: NetworkStatus.userNotFound,
            statusCode: response.statusCode,
          ) as BaseResponseModel<T>;
        }
        final userData =
            UserModel.fromJson(response.data! as Map<String, dynamic>);
        await ProductItems.sharedManager.setStringValue(
          PreferenceKey.userName,
          userData.user.toJson().toString(),
        );
        return BaseResponseModel(
          data: userData,
          statusCode: response.statusCode,
        ) as BaseResponseModel<T>;
      }
      return BaseResponseModel(
        data: NetworkStatus.userNotFound,
        statusCode: response.statusCode,
      ) as BaseResponseModel<T>;
    } on DioException catch (e) {
      final response = e.response?.data as Map<String, dynamic>;
      return BaseResponseModel(
        data: NetworkStatus.getStatus(response['message'] as String),
        statusCode: e.response?.statusCode,
      ) as BaseResponseModel<T>;
    }
  }

  @override
  Future<BaseResponseModel<T>> updateProfile<T>(
    UpdateModel<dynamic>? model,
    String? id,
  ) async {
    final cookie =
        ProductItems.sharedManager.getStringValue(PreferenceKey.cookie);
    try {
      final response = await ProductItems.networkService
          .put<BaseResponseModel<NetworkStatus>>(
        '${AppNetwork.userPath}/$id',
        options: Options(
          headers: {
            'authorization': cookie,
          },
        ),
        data: model?.toJson(),
      );
      if (response.statusCode == 200) {
        return BaseResponseModel<NetworkStatus>(
          data: NetworkStatus.updateSuccess,
          statusCode: response.statusCode,
        ) as BaseResponseModel<T>;
      } else {
        return BaseResponseModel<NetworkStatus>(
          data: NetworkStatus.updateFailed,
          statusCode: response.statusCode,
        ) as BaseResponseModel<T>;
      }
    } on DioException catch (e) {
      final response = e.response?.data as Map<String, dynamic>;
      return BaseResponseModel<NetworkStatus>(
        data: NetworkStatus.getStatus(response['message'] as String),
        statusCode: e.response?.statusCode,
      ) as BaseResponseModel<T>;
    }
  }
}
