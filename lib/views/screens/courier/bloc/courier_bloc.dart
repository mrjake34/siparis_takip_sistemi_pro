import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:siparis_takip_sistemi_pro/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/courier/model/courier.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/courier/service/courier_service.dart';

part 'courier_event.dart';
part 'courier_state.dart';

class CourierBloc extends Bloc<CourierEvent, CourierState> {
  CourierBloc() : super(const CourierState()) {
    on<CourierEvent>((event, emit) async {
      emit(state.copyWith(status: Status.isLoading));
      final response = await CourierService().getCouriers();
      emit(state.copyWith(status: Status.isDone, courierList: response));
    });
  }
}
