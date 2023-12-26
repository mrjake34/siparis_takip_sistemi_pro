part of 'courier_bloc.dart';

class CourierEvent extends Equatable {
  const CourierEvent();

  @override
  List<Object> get props => [];
}

class CourierLoadEvent extends CourierEvent {}

class CourierCreateEvent extends CourierEvent {
  const CourierCreateEvent(this.courier);

  final CourierModel courier;

  @override
  List<Object> get props => [courier];
}

class CourierUpdateEvent extends CourierEvent {
  const CourierUpdateEvent(this.courier);

  final CourierModel courier;

  @override
  List<Object> get props => [courier];
}

class CourierDeleteEvent extends CourierEvent {
  const CourierDeleteEvent(this.courier);

  final CourierModel courier;

  @override
  List<Object> get props => [courier];
}

final class GetCourierLisEvent extends CourierEvent {
  const GetCourierLisEvent(this.courierList);

  final List<CourierModel> courierList;

  @override
  List<Object> get props => [courierList];
}

final class GetCourierEvent extends CourierEvent {
  const GetCourierEvent(this.courier);

  final CourierModel courier;

  @override
  List<Object> get props => [courier];
}

final class PasswordVisisbilityEvent extends CourierEvent {}

final class PasswordAgainVisisbilityEvent extends CourierEvent {}
