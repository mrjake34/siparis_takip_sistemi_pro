import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_request_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/service/login_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/model/user_response_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_bloc.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:vexana/vexana.dart';

import '../../../../product/core/constants/enums/enums.dart';
import '../../../../product/utils/getit/product_items.dart';
import '../../../../product/utils/translations/locale_keys.g.dart';
import '../../../screens/profile/model/user.dart';
import '../../../screens/profile/service/profile_service.dart';
import '../model/login_response_model.dart';

part 'login_event.dart';
part 'login_state.dart';

final class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  LoginBloc({this.emailController, this.passwordController})
      : super(const LoginState()) {
    final loginService = LoginService();
    on<DoLoginEvent>((event, emit) async {
      final data = {
        'email': emailController?.text.trim(),
        'password': passwordController?.text.trim(),
      };
      emit(state.copyWith(status: Status.isLoading));

      try {
        final response = await loginService.login<BaseResponseModel<User>>(
            loginModel: LoginRequestModel(
          email: emailController?.text.trim(),
          password: passwordController?.text.trim(),
        ));
        print(response.headers);

        if (response.statusCode == HttpStatus.ok) {
          final model = LoginResponseModel.fromJson(
            response.data! as Map<String, dynamic>,
          );
          await ProductItems.sharedManager.setStringValue(
            PreferenceKey.cookie,
            cookie,
          );

          await sharedManager.setStringValue(
            PreferenceKey.cookie,
            cookie ?? '',
          );
          await sharedManager.setStringValue(
            PreferenceKey.userId,
            model.User?.Id ?? '',
          );

          emit(
            state.copyWith(
              status: Status.isDone,
              model: user,
            ),
          );
        } else if (response.statusCode == 400) {
          utils.errorSnackBar(LocaleKeys.errors_userInfoIncorrect.tr());
          emit(state.copyWith(status: UserStatus.userNotFound));
        } else {
          utils.errorSnackBar(LocaleKeys.errors_loginError.tr());
          emit(state.copyWith(status: Status.isFailed));
        }
      } on DioException catch (e) {
        print(e);
        if (e.response?.statusCode == 400) {
          utils.errorSnackBar(LocaleKeys.errors_userInfoIncorrect.tr());
          return emit(state.copyWith(status: Status.isFailed));
        }
        utils.errorSnackBar(LocaleKeys.errors_loginError.tr());
        return emit(state.copyWith(status: Status.isFailed));
      }
    });
    on<AutoLoginEvent>((event, emit) async {
      emit(state.copyWith(autoLogin: AutoLogin.isLoading));
      final cookie = sharedManager.getStringValue(PreferenceKey.cookie);
      final id = sharedManager.getStringValue(PreferenceKey.userId);
      if (cookie.isNotEmpty || id.isNotEmpty) {
        try {
          final user = await ProfileService().fetchUserDetails();
          emit(state.copyWith(model: user, autoLogin: AutoLogin.completed));
        } on Exception {
          emit(state.copyWith(autoLogin: AutoLogin.failed));
        }
      } else {
        emit(state.copyWith(autoLogin: AutoLogin.failed));
      }
    });
  }
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
}
