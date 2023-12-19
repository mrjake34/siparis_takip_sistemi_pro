import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import '../../../../product/core/constants/enums/enums.dart';
import '../model/user.dart';
import '../service/profile_service.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(const UserProfileState()) {
    on<FetchUserDetailsEvent>((event, emit) async {
      emit(state.copyWith(status: Status.isLoading));
      final response =
          await ProfileService().getProfile<BaseResponseModel<UserModel>>();
      if (response.data != null) {
        emit(
          state.copyWith(
            status: Status.isDone,
            user: response.data! as UserModel,
          ),
        );
      } else {
        emit(state.copyWith(status: Status.isFailed));
      }
    });
  }
}
