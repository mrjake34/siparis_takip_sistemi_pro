import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/model/user_response_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';
import '../../../../product/core/constants/enums/enums.dart';
import '../../../../product/utils/getit/product_items.dart';
import '../model/user.dart';
import '../service/profile_service.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(const UserProfileState()) {
    final profileService = ProfileService();
    on<FetchUserDetailsEvent>((event, emit) async {
      emit(state.copyWith(status: Status.isLoading));
      final response = await profileService.getProfile<UserResponseModel>();
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
            user: User(),
          ),
        );
      } else {
        emit(state.copyWith(status: Status.isFailed));
      }
    });
  }
}
