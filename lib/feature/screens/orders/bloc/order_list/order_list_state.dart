part of 'order_list_bloc.dart';

sealed class OrderListState extends Equatable {
  const OrderListState();
  
  @override
  List<Object> get props => [];
}

final class OrderListInitial extends OrderListState {}
