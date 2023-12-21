import 'package:flutter/material.dart';

import '../../../../product/core/base/interface/base_network_model.dart';
import '../../../../product/core/base/models/base_respose_model.dart';

@immutable
abstract class ILoginService {
  Future<BaseResponseModel<T>> login<T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<T>> logout<T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<T>> googleLogin<T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<T>> appleLogin<T extends IBaseNetworkModel<T>>();
}
