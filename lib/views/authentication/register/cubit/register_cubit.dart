// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:siparis_takip_sistemi_pro/core/base/models/base_model_view.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/core/utils/translation/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/views/authentication/register/cubit/register_state.dart';
import 'package:siparis_takip_sistemi_pro/views/authentication/register/model/register_request_model.dart';
import 'package:siparis_takip_sistemi_pro/views/authentication/register/model/register_response_error_model.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/constants/network/url.dart';

class RegisterCubit extends Cubit<RegisterState> with BaseModelView {
  final TextEditingController? nameController;
  final TextEditingController? phoneController;
  final TextEditingController? emailController;
  final TextEditingController? shopNameController;
  final TextEditingController? passwordController;
  final TextEditingController? password2Controller;
  final GlobalKey<FormBuilderState>? formKey;
  late final INetworkManager networkManager;

  bool registerFail = false;
  bool isLoading = false;

  RegisterCubit({
    this.nameController,
    this.phoneController,
    this.emailController,
    this.shopNameController,
    this.passwordController,
    this.password2Controller,
    this.formKey,
  }) : super(const RegisterState());

  Future<void> postRegisterModel() async {
    
    if (passwordController?.text.trim() == password2Controller?.text.trim()) {
      try {
        emit(const RegisterState(status: Status.isLoading));
        networkService.dio.options.headers = {
          'Access-Control-Request-Headers': 'access-control-allow-credentials'
              'access-control-allow-headers'
              'access-control-allow-methods'
              'access-control-allow-origin'
              'content-type',
        };
        final data = RegisterRequestModel(
          name: nameController?.text.trim(),
          email: emailController?.text.trim(),
          phone: phoneController?.text.trim(),
          password: passwordController?.text.trim(),
          shopName: shopNameController?.text.trim(),
        ).toJson();
        final response = await networkService.dio.post(
          appNetwork.signup,
          data: data,
        );
        if (response.statusCode == 200) {
          return emit(const RegisterState(status: Status.isDone));
        }
      } on DioException catch (e) {
        if (e.response?.statusCode == 400) {
          final data = RegisterResponseErrorModel.fromJson(
            e.response?.data as Map<String, dynamic>,
          );
          if (data.message == 'Shopname already exists') {
            utils.errorSnackBar(LocaleKeys.errors_shopNameAlreadyExists.tr());
            return emit(const RegisterState(status: Status.isFailed));
          } else if (data.message == 'Shopname already exists') {
            utils.errorSnackBar(LocaleKeys.errors_shopNameAlreadyExists.tr());
            return emit(const RegisterState(status: Status.isFailed));
          } else if (data.message == 'Email is already in use') {
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
    } else {
      utils.errorSnackBar(LocaleKeys.errors_passwordDontMatch.tr());
      emit(const RegisterState(status: Status.isFailed));
    }
  }
}
