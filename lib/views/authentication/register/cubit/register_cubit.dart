// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:siparis_takip_sistemi_pro/core/base/models/base_model_view.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/app/app_constants.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/views/authentication/register/model/register_response_error_model.dart';

import '../../../../core/init/translation/locale_keys.g.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> with BaseModelView {
  final TextEditingController? nameController;
  final TextEditingController? phoneController;
  final TextEditingController? emailController;
  final TextEditingController? shopNameController;
  final TextEditingController? passwordController;
  final TextEditingController? password2Controller;
  final GlobalKey<FormBuilderState>? formKey;

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

  Dio dio = Dio(BaseOptions(baseUrl: AppConstats.baseUrl));

  Future<void> postRegisterModel() async {
    if (passwordController?.text.trim() == password2Controller?.text.trim()) {
      try {
        emit(const RegisterState(status: Status.isLoading));
        dio.options.headers = {
          "Access-Control-Request-Headers":
              "access-control-allow-credentials,access-control-allow-headers,access-control-allow-methods,access-control-allow-origin,content-type",
        };
        final response = await dio.post(AppConstats.signup, data: {
          "name": nameController?.text.trim(),
          "phone": phoneController?.text.trim(),
          "email": emailController?.text.trim(),
          "password": passwordController?.text.trim(),
          "shopName": shopNameController?.text.trim()
        });
        if (response.statusCode == 200) {
          return emit(const RegisterState(status: Status.isDone));
        }
      } on DioException catch (e) {
        if (e.response?.statusCode == 400) {
          RegisterResponseErrorModel data =
              RegisterResponseErrorModel.fromJson(e.response?.data);
          if (data.message == "Shopname already exists") {
            utils.errorSnackBar(LocaleKeys.errors_shopNameAlreadyExists.tr());
            return emit(const RegisterState(status: Status.isFailed));
          } else if (data.message == "Shopname already exists") {
            utils.errorSnackBar(LocaleKeys.errors_shopNameAlreadyExists.tr());
            return emit(const RegisterState(status: Status.isFailed));
          } else if (data.message == "Email is already in use") {
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
