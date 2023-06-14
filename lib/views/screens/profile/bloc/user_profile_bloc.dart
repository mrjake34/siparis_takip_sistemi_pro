import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/views/models/user_model/user.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/profile/service/profile_service.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(const UserProfileState()) {
    on<FetchUserDetailsEvent>((event, emit) async {
      emit(state.copyWith(status: Status.isLoading));
      final response =
          await ProfileService().fetchUserDetails(id: event.userId);
      if (response is User) {
        emit(state.copyWith(status: Status.isDone, user: response));
      } else {
        emit(state.copyWith(status: Status.isFailed));
      }
    });
  }
}
