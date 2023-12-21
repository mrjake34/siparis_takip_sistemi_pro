// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_model_view.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/cubit/register_state.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/model/register_request_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/model/register_response_error_model.dart';
import 'package:vexana/vexana.dart';

import '../../../../product/core/constants/enums/network_status.dart';

class RegisterCubit extends Cubit<RegisterState> {
  late final INetworkManager networkManager;

  bool registerFail = false;
  bool isLoading = false;

  RegisterCubit() : super(const RegisterState());

  Future<void> postRegisterModel({RegisterRequestModel? model}) async {
    if (model == null) {
      return emit(const RegisterState(status: Status.isFailed));
    }
    try {
      emit(const RegisterState(status: Status.isLoading));
      final response = await networkService.dio.post(
        appNetwork.signup,
        data: data,
      );
      if (response.statusCode == HttpStatus.ok) {
        return emit(const RegisterState(status: Status.isDone));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == HttpStatus.badRequest) {
        final data = RegisterResponseErrorModel.fromJson(
          e.response?.data as Map<String, dynamic>,
        );
        if (data.message == RegisterErrors.shopNameAlreadyExists.error) {
          utils.errorSnackBar(LocaleKeys.errors_shopNameAlreadyExists.tr());
          return emit(const RegisterState(status: Status.isFailed));
        } else if (data.message == RegisterErrors.emailAlreadyExists.error) {
          utils.errorSnackBar(LocaleKeys.errors_emailAlreadyExists.tr());
          return emit(const RegisterState(status: Status.isFailed));
        } else {
          utils.errorSnackBar(LocaleKeys.errors_errorUserRegister.tr());
          emit(const RegisterState(status: Status.isFailed));
        }
      } else {
        return emit(const RegisterState(status: Status.isFailed));
      }
    }
  }
}
