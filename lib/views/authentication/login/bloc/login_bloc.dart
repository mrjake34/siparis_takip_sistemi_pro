import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../core/base/models/base_model_view.dart';
import '../../../../core/constants/enums/enums.dart';
import '../../../../core/init/translation/locale_keys.g.dart';
import '../../../models/user_model/user.dart';
import '../../../screens/profile/service/profile_service.dart';
import '../model/login_response_model.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with BaseModelView {
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  LoginBloc({this.emailController, this.passwordController})
      : super(const LoginState()) {
    on<DoLoginEvent>(
      (event, emit) async {
        emit(state.copyWith(status: Status.isLoading));
        try {
          final response = await networkService.dio.post(
            appNetwork.login,
            data: {
              'email': emailController?.text.trim(),
              'password': passwordController?.text.trim()
            },
          );
          if (response.statusCode == HttpStatus.ok) {
            String? cookie = response.headers["authorization"]?.first;
            LoginResponseModel model =
                LoginResponseModel.fromJson(response.data);
            await sharedManager.setStringValue(
                PreferenceKey.cookie, cookie ?? "");
            await sharedManager.setStringValue(
                PreferenceKey.userId, model.user?.id ?? "");
            User? user =
                await ProfileService().fetchUserDetails(id: model.user?.id);
            emit(state.copyWith(
              status: Status.isDone,
              model: user,
            ));
          } else if (response.statusCode == 400) {
            utils.errorSnackBar(LocaleKeys.errors_userInfoIncorrect.tr());
            emit(state.copyWith(status: UserStatus.userNotFound));
          } else {
            utils.errorSnackBar(LocaleKeys.errors_loginError.tr());
            emit(state.copyWith(status: Status.isFailed));
          }
        } on DioException catch (e) {
          if (e.response?.statusCode == 400) {
            utils.errorSnackBar(LocaleKeys.errors_userInfoIncorrect.tr());
            emit(state.copyWith(status: UserStatus.userNotFound));
          } else {
            utils.errorSnackBar(LocaleKeys.errors_loginError.tr());
            emit(state.copyWith(status: Status.isFailed));
          }
        }
      },
    );
    on<AutoLoginEvent>((event, emit) async {
      emit(state.copyWith(autoLogin: AutoLogin.isLoading));
      final cookie = sharedManager.getStringValue(PreferenceKey.cookie);
      final id = sharedManager.getStringValue(PreferenceKey.userId);
      if (cookie.isNotEmpty || id.isNotEmpty) {
        try {
          User? user = await ProfileService().fetchUserDetails(id: id);
          emit(state.copyWith(model: user, autoLogin: AutoLogin.completed));
        } on Exception {
          emit(state.copyWith(autoLogin: AutoLogin.failed));
        }
      } else {
        emit(state.copyWith(autoLogin: AutoLogin.failed));
      }
    });
  }
}
