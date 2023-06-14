import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/core/base/models/base_model_view.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/enums/enums.dart';
part 'courier_login_page_state.dart';

class CourierLoginPageCubit extends Cubit<CourierLoginPageState>
    with BaseModelView {
  CourierLoginPageCubit({this.emailControlller, this.passwordController})
      : super(const CourierLoginPageState());
  final TextEditingController? emailControlller;
  final TextEditingController? passwordController;

  Future<void> loginUser() async {
    emit(const CourierLoginPageState(status: Status.isLoading));
    try {
      final response = await networkService.dio.post(
        appNetwork.courierLoginUrl,
        data: {
          'email': emailControlller?.text.trim(),
          'password': passwordController?.text.trim()
        },
      );
      final cookie =
          response.headers['set-cookie']?.first ?? 'Login Courier Cookie';
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
