import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/model/user_response_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_bloc.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/cache/shared_manager.dart';
import '../../../../product/core/constants/enums/enums.dart';
import '../model/user_model.dart';
import '../service/profile_service.dart';

part 'profile_page_event.dart';
part 'profile_page_state.dart';

class ProfilePageBloc extends BaseBloc<ProfilePageEvent, ProfilePageState> {
  ProfilePageBloc(ProfileService profileService)
      : _profileService = profileService,
        super(const ProfilePageState()) {
    on<FetchUserDetailsEvent>((event, emit) async {
      safeEmit(state.copyWith(status: Status.isLoading));

      final cookie = SharedManager.instance.get<String>(PreferenceKey.cookie);
      final user = SharedManager.instance.getModel();
      if (cookie == null || user == null) {
        safeEmit(state.copyWith(status: Status.isFailed));
        return;
      }
      final response = await _profileService.getProfile<UserResponseModel>(
        cookie: cookie,
        id: user.id,
        model: UserResponseModel(),
      );
      if (response.data != null || response.data?.user != null) {
        safeEmit(
          state.copyWith(
            status: Status.isDone,
            user: response.data?.user,
            networkStatus: response.networkStatus,
          ),
        );
      } else {
        safeEmit(state.copyWith(status: Status.isFailed));
      }
    });
    on<UserLogoutEvent>((event, emit) async {
      safeEmit(state.copyWith(status: Status.isLoading));
      final response = SharedManager.instance.clearSavedModel();
      if (response == true) {
        safeEmit(
          state.copyWith(
            status: Status.isDone,
            user: const UserModel(),
          ),
        );
      } else {
        safeEmit(state.copyWith(status: Status.isFailed));
      }
    });
  }
  late final ProfileService _profileService;
}
