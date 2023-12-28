import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/model/user_response_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_bloc.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';
import '../../../../product/core/constants/enums/enums.dart';
import '../../../../product/utils/getit/product_items.dart';
import '../model/user.dart';
import '../service/profile_service.dart';

part 'profile_page_event.dart';
part 'profile_page_state.dart';

class ProfilePageBloc extends BaseBloc<ProfilePageEvent, ProfilePageState> {
  ProfilePageBloc() : super(const ProfilePageState()) {
    final profileService = ProfileService();
    on<FetchUserDetailsEvent>((event, emit) async {
      emit(state.copyWith(status: Status.isLoading));
      final response = await profileService
          .getProfile<UserResponseModel, UserResponseModel>();
      if (response.data != null || response.data?.user != null) {
        emit(
          state.copyWith(
            status: Status.isDone,
            user: response.data?.user,
            networkStatus: response.networkStatus,
          ),
        );
      } else {
        emit(state.copyWith(status: Status.isFailed));
      }
    });
    on<UserLogoutEvent>((event, emit) async {
      emit(state.copyWith(status: Status.isLoading));
      final response = await ProductItems.sharedManager.clearSavedModel();
      if (response == true) {
        emit(
          state.copyWith(
            status: Status.isDone,
            user: const User(),
          ),
        );
      } else {
        emit(state.copyWith(status: Status.isFailed));
      }
    });
  }
}
