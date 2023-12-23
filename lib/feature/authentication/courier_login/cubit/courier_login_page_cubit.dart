import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_request_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/model/login_response_model.dart';

import '../../../../product/core/constants/enums/enums.dart';
import '../../../../product/core/constants/enums/network_status.dart';
import '../service/courier_login_service.dart';

part 'courier_login_page_state.dart';

class CourierLoginPageCubit extends Cubit<CourierLoginPageState> {
  CourierLoginPageCubit({required this.courierService})
      : super(const CourierLoginPageState());
  late final CourierLoginService courierService;

  Future<void> loginUser({LoginRequestModel? data}) async {
    emit(const CourierLoginPageState(status: Status.isLoading));
    try {
      final response = await courierService.login<LoginResponseModel>(
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
      final cookie = response.getCookie(headers: response.headers);
      // final jsonString = json.decode(response.data.toString());
      // final courier = Courier.fromJson(jsonString);
      final role = response.data['Courier']['role'];
      final id = response.data['Courier']['Id'];
      await sharedManager.setStringValue(PreferenceKey.id, id.toString());
      await sharedManager.setStringValue(PreferenceKey.cookie, cookie);
      await sharedManager.setStringValue(PreferenceKey.role, role.toString());
      emit(const CourierLoginPageState(status: Status.isDone));
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        emit(state.copyWith(status: UserStatus.userNotFound));
      } else {
        emit(state.copyWith(status: Status.isFailed));
      }
    }
  }
}
