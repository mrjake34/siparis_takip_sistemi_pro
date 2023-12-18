import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';
import '../../../../product/core/base/models/base_model_view.dart';
import '../../../../product/core/constants/enums/enums.dart';
import '../../../../product/utils/translations/locale_keys.g.dart';
import '../model/login_response_model.dart';
import '../../../screens/profile/model/user.dart';
import '../../../screens/profile/service/profile_service.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with BaseModelView {
  LoginBloc({this.emailController, this.passwordController})
      : super(const LoginState()) {
    on<DoLoginEvent>((event, emit) async {
      final data = {
        'email': emailController?.text.trim(),
        'password': passwordController?.text.trim(),
      };
      emit(state.copyWith(status: Status.isLoading));

      try {
        final response = await networkService.dio.post(
          appNetwork.login,
          data: data,
        );
        print(response.headers);

        if (response.statusCode == HttpStatus.ok) {
          final cookie =
              response.headers.map[HttpHeaders.authorizationHeader]?.first;

          final model = LoginResponseModel.fromJson(
            response.data! as Map<String, dynamic>,
          );

          await sharedManager.setStringValue(
            PreferenceKey.cookie,
            cookie ?? '',
          );
          await sharedManager.setStringValue(
            PreferenceKey.userId,
            model.User?.Id ?? '',
          );
          final user = await ProfileService().fetchUserDetails();
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
