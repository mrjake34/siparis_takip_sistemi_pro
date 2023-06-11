import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../core/base/models/base_model_view.dart';
import '../../../../core/constants/enums/enums.dart';

import '../../../../core/constants/app/app_constants.dart';

part 'courier_login_page_state.dart';

class CourierLoginPageCubit extends Cubit<CourierLoginPageState>
    with BaseModelView {
  final TextEditingController? emailControlller;
  final TextEditingController? passwordController;
  CourierLoginPageCubit({this.emailControlller, this.passwordController})
      : super(const CourierLoginPageState());
  Dio dio = Dio(BaseOptions(baseUrl: AppConstats.baseUrl));

  Future<void> loginUser() async {
    emit(const CourierLoginPageState(status: Status.isLoading));
      try {
        final response = await dio.post(AppConstats.courierLoginUrl, data: {
          "email": emailControlller?.text.trim(),
          "password": passwordController?.text.trim()
        });
        String cookie = response.headers['set-cookie']?.first ?? "Login Courier Cookie";
        String role = response.data['Courier']['role'];
        String id = response.data['Courier']['Id'];
        await sharedManager.setStringValue(PreferenceKey.id, id);
        await sharedManager.setStringValue(PreferenceKey.cookie, cookie);
        await sharedManager.setStringValue(PreferenceKey.role, role);
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
