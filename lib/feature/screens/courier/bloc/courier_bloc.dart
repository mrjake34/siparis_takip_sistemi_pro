import 'package:equatable/equatable.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/model/courier_response_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_bloc.dart';

import '../../../../product/core/constants/enums/enums.dart';
import '../model/courier_model.dart';
import '../service/courier_service.dart';

part 'courier_event.dart';
part 'courier_state.dart';

class CourierBloc extends BaseBloc<CourierEvent, CourierState> {
  CourierBloc(this.courierService) : super(const CourierState()) {
    on<CourierEvent>((event, emit) async {
      safeEmit(state.copyWith(status: Status.isLoading));
      final response = await courierService.getCouriers<CourierResponseModel>();
      safeEmit(
        state.copyWith(
          status: Status.isDone,
          courierList: response.data?.couriers,
        ),
      );
    });
    on<PasswordVisisbilityEvent>((event, emit) {
      safeEmit(
        state.copyWith(isPasswordVisible: !(state.isPasswordVisible ?? false)),
      );
    });
    on<PasswordAgainVisisbilityEvent>((event, emit) {
      safeEmit(
        state.copyWith(
          isPasswordAgainVisible: !(state.isPasswordAgainVisible ?? false),
        ),
      );
    });
  }
  late final CourierService courierService;
}
