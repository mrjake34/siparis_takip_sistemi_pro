import 'dart:io';

import 'package:bloc/src/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_request_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_response_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/service/login_service.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_bloc.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';

import '../../../../product/core/constants/enums/enums.dart';
import '../../../screens/profile/model/user.dart';
import '../../../screens/profile/service/profile_service.dart';

part 'login_event.dart';
part 'login_state.dart';

final class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  LoginBloc({
    required this.loginService,
    required this.profileService,
  }) : super(
          const LoginState(),
        ) {
    on<UserLoginEvent>((event, emit) async {
      await _userLogin(emit, event);
    });
    on<AutoLoginEvent>((event, emit) async {
      await _autoLogin(event);
    });

    on<PasswordVisibilityEvent>((event, emit) async {
      safeEmit(
        state.copyWith(
          passwordVisibility: !(state.passwordVisibility ?? true),
        ),
      );
    });
  }
  late final LoginService loginService;
  late final ProfileService profileService;

  Future<void> _autoLogin(AutoLoginEvent event) async {
    if (event.autoLogin == null ||
        event.autoLogin == false ||
        event.cookie == null ||
        event.id == null) {
      safeEmit(state.copyWith(status: Status.isFailed, autoLogin: false));
    }

    safeEmit(state.copyWith(status: Status.isLoading));
    final response = await profileService.getProfile<User>(
      id: event.id,
      cookie: event.cookie,
    );
    if (response.statusCode != HttpStatus.ok) {
      safeEmit(
        state.copyWith(
          status: Status.isFailed,
          networkStatus: response.networkStatus,
          errorMessage: response.data?.message ?? '',
        ),
      );
    }
    safeEmit(
      state.copyWith(
        model: response.data,
        status: Status.isDone,
        autoLogin: true,
      ),
    );
  }

  Future<void> _userLogin(
    Emitter<LoginState> emit,
    UserLoginEvent event,
  ) async {
    safeEmit(state.copyWith(status: Status.isLoading));
    final response = await loginService.login<LoginResponseModel>(
      loginModel: event.model,
      model: LoginResponseModel(),
    );
    if (response.statusCode != HttpStatus.ok) {
      safeEmit(
        state.copyWith(
          status: Status.isFailed,
          networkStatus: response.networkStatus,
          errorMessage: response.data?.error?.message ?? '',
        ),
      );
    }
    final cookie = response.getCookie(headers: response.headers);
    final user = await profileService.getProfile<User>(
      cookie: cookie,
      id: response.data?.user?.id,
    );
    safeEmit(
      state.copyWith(
        status: Status.isDone,
        model: user.data,
        networkStatus: NetworkStatus.loginSuccess,
        cookie: cookie,
      ),
    );
  }
}
