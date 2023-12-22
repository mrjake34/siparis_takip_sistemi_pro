import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../product/core/constants/enums/enums.dart';

part 'password_reset_state.dart';

class PasswordResetCubit extends Cubit<PasswordResetState> {
  PasswordResetCubit({this.emailController})
      : super(const PasswordResetState());
  final TextEditingController? emailController;

  Future<void> sendResetPasswordEmail() async {
    emit(state.copyWith(status: Status.isLoading));
    try {
      emit(state.copyWith(status: Status.isDone));
    } catch (e) {
      emit(state.copyWith(status: Status.isFailed));
    }
  }
}
