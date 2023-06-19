import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/constants/enums/enums.dart';
import '../model/courier.dart';
import '../service/courier_service.dart';

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
