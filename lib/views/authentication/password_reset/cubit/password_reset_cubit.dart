import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../core/base/models/base_model_view.dart';
import '../../../../core/constants/enums/enums.dart';

part 'password_reset_state.dart';

class PasswordResetCubit extends Cubit<PasswordResetState> with BaseModelView {
  final TextEditingController? emailController;
  PasswordResetCubit({this.emailController}) : super(const PasswordResetState());

  Future<void> sendResetPasswordEmail() async {
    emit(state.copyWith(status: Status.isLoading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(status: Status.isDone));
    } catch (e) {
      emit(state.copyWith(status: Status.isFailed));
    }
  }
}
