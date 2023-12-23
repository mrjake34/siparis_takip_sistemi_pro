// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/cubit/register_state.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/model/register_request_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/model/register_response_error_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/service/register_service.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_cubit.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';
import 'package:vexana/vexana.dart';

import '../../../../product/core/constants/enums/network_status.dart';

class RegisterCubit extends BaseCubit<RegisterState> {
  late final INetworkManager networkManager;

  bool registerFail = false;
  bool isLoading = false;

  RegisterCubit() : super(const RegisterState());

  Future<void> postRegisterModel({RegisterRequestModel? data}) async {
    if (data == null) {
      return safeEmit(state.copyWith(status: Status.isFailed));
    }
    safeEmit(state.copyWith(status: Status.isLoading));
    final response = await RegisterService().register<RegisterResponseModel>(
      model: RegisterResponseModel(),
      data: data,
    );
    if (response.statusCode == HttpStatus.ok) {
      return emit(const RegisterState(status: Status.isDone));
    } else if (response.statusCode == HttpStatus.badRequest) {
      if (response.data == null) {
        return safeEmit(state.copyWith(status: Status.isFailed));
      }
      final data = RegisterResponseModel.fromJson(
        response.data! as Map<String, dynamic>,
      );
      if (data.message == RegisterErrors.shopNameAlreadyExists.error) {
        safeEmit(
          state.copyWith(
            status: Status.isFailed,
            message: LocaleKeys.errors_shopNameAlreadyExists.tr(),
          ),
        );
      } else if (data.message == RegisterErrors.emailAlreadyExists.error) {
        safeEmit(
          state.copyWith(
            status: Status.isFailed,
            message: LocaleKeys.errors_emailAlreadyExists.tr(),
          ),
        );
      } else {
        safeEmit(state.copyWith(status: Status.isFailed));
      }
    } else {
      safeEmit(state.copyWith(status: Status.isFailed));
    }
  }

  void agreementCheck({bool? value}) {
    safeEmit(state.copyWith(agreementCheck: value));
  }

  void passwordVisibility() {
    safeEmit(
      state.copyWith(
        passwordVisibility: !(state.passwordVisibility ?? true),
      ),
    );
  }

  void passwordAgainVisibility() {
    safeEmit(
      state.copyWith(
        passwordAgainVisibility: !(state.passwordAgainVisibility ?? true),
      ),
    );
  }
}
