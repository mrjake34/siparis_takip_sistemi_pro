import 'package:equatable/equatable.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_request_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_response_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/service/login_service.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_bloc.dart';

import '../../../../product/core/constants/enums/enums.dart';
import '../../../screens/profile/model/user.dart';
import '../../../screens/profile/service/profile_service.dart';

part 'login_event.dart';
part 'login_state.dart';

final class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    final loginService = LoginService();
    on<UserLoginEvent>((event, emit) async {
      emit(state.copyWith(status: Status.isLoading));

      final response = await loginService.login<LoginResponseModel>(
        loginModel: event.model,
        model: LoginResponseModel(),
      );

      if (response.data != null) {
        final cookie = response.getCookie(headers: response.headers);
        final user = await ProfileService().getProfile<User>(
          cookie: cookie,
          id: response.data?.user?.id,
        );
        safeEmit(
          state.copyWith(
            status: Status.isDone,
            model: user.data,
          ),
        );
      } else {
        safeEmit(state.copyWith(
          status: Status.isFailed,
          errorMessage: response.error?.message,
        ));
      }
    });
    on<AutoLoginEvent>((event, emit) async {
      if (event.autoLogin == null ||
          event.autoLogin == false ||
          event.cookie == null ||
          event.id == null) {
        emit(state.copyWith(status: Status.isFailed, autoLogin: false));
        return;
      }

      final response = await ProfileService().getProfile<User>(
        id: event.id,
        cookie: event.cookie,
      );
      emit(
        state.copyWith(
          model: response.data,
          status: Status.isDone,
          autoLogin: true,
        ),
      );
    });
  }
}
