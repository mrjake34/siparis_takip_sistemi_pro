import 'package:flutter/material.dart';
import '../../../../product/core/base/interface/base_network_model.dart';
import '../../../../product/core/base/models/base_respose_model.dart';

@immutable
abstract class ILoginService {
  Future<BaseResponseModel<R>> login<R, T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<R>> logout<R, T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<R>> googleLogin<R, T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<R>> appleLogin<R, T extends IBaseNetworkModel<T>>();
}
