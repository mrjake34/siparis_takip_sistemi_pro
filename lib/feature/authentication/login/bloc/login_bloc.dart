import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_request_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_response_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/service/login_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/model/user_response_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/mixin/headers_mixin.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_bloc.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';

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
      await _userLogin(event);
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
    on<LogoutEvent>((event, emit) {
      safeEmit(
        state.copyWith(
          status: Status.isDone,
          userStatus: UserStatus.logout,
          model: const User.empty(),
          cookie: '',
        ),
      );
    });
  }
  late final LoginService loginService;
  late final ProfileService profileService;

  Future<void> _autoLogin(AutoLoginEvent event) async {
    if (event.autoLogin == false) {
      safeEmit(
        state.copyWith(status: Status.isFailed, autoLogin: AutoLogin.failed),
      );
      return;
    }
    safeEmit(
      state.copyWith(
        status: Status.isLoading,
        autoLogin: AutoLogin.isLoading,
      ),
    );
    final cookie =
        await ProductItems.sharedManager.getStringValue(PreferenceKey.cookie);
    final user = await ProductItems.sharedManager.getModel();
    if (cookie.isEmpty || user == null) {
      safeEmit(
        state.copyWith(status: Status.isFailed, autoLogin: AutoLogin.failed),
      );
      return;
    }
    final response =
        await profileService.getProfile<UserResponseModel, UserResponseModel>(
      id: user.id,
      cookie: cookie,
      model: UserResponseModel(),
    );
    if (response.statusCode != HttpStatus.ok) {
      safeEmit(
        state.copyWith(
          status: Status.isFailed,
          networkStatus: response.networkStatus,
          errorMessage: response.message,
        ),
      );
    }
    safeEmit(
      state.copyWith(
        model: response.data?.user,
        status: Status.isDone,
        autoLogin: AutoLogin.completed,
      ),
    );
  }

  Future<void> _userLogin(
    UserLoginEvent event,
  ) async {
    safeEmit(state.copyWith(status: Status.isLoading));
    final response =
        await loginService.login<LoginResponseModel, LoginResponseModel>(
      loginModel: event.model,
      model: LoginResponseModel(),
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
    final cookie =
        response.getCookie(response.headers, type: CookieTypes.setCookie);
    final user =
        await profileService.getProfile<UserResponseModel, UserResponseModel>(
      cookie: cookie,
      id: response.data?.user?.id,
      model: UserResponseModel(),
    );
    await ProductItems.sharedManager.saveModel(
      model: user.data?.user,
    );
    await ProductItems.sharedManager
        .setStringValue(PreferenceKey.cookie, cookie ?? '');
    safeEmit(
      state.copyWith(
        status: Status.isDone,
        model: user.data?.user,
        networkStatus: NetworkStatus.loginSuccess,
        cookie: cookie,
      ),
    );
  }
}
