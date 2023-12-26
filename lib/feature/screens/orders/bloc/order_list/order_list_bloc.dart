import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_list_event.dart';
part 'order_list_state.dart';

class OrderListBloc extends Bloc<OrderListEvent, OrderListState> {
  OrderListBloc() : super(OrderListInitial()) {
    on<OrderListEvent>((event, emit) {});
  }
}
