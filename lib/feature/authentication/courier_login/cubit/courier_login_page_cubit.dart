import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_request_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_response_model.dart';

import '../../../../product/core/constants/enums/enums.dart';
import '../../../../product/core/constants/enums/network_status.dart';
import '../service/courier_login_service.dart';

part 'courier_login_page_state.dart';

class CourierLoginPageCubit extends Cubit<CourierLoginPageState> {
  CourierLoginPageCubit({required this.courierLoginService})
      : super(const CourierLoginPageState());
  late final CourierLoginService courierLoginService;

  Future<void> loginUser({LoginRequestModel? data}) async {
    emit(const CourierLoginPageState(status: Status.isLoading));

    final response = await courierLoginService.login<LoginResponseModel>(
      data: data,
      model: LoginResponseModel(),
    );
    if (response.statusCode != HttpStatus.ok) {
      emit(
        state.copyWith(
          status: Status.isFailed,
          networkStatus: response.networkStatus,
          errorMessage: response.data?.message ?? '',
        ),
      );
    }

    emit(const CourierLoginPageState(status: Status.isDone));
  }

  void changeVisibility() {
    emit(
      state.copyWith(
        isPasswordVisible: !(state.isPasswordVisible ?? true),
      ),
    );
  }
}
