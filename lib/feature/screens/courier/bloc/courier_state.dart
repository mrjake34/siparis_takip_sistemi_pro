// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'courier_bloc.dart';

class CourierState extends Equatable {
  const CourierState({this.courierList, this.courier, this.status});
  final CourierList? courierList;
  final Courier? courier;
  final Enum? status;

  @override
  List<Object?> get props => [status, courier, courierList];

  CourierState copyWith({
    CourierList? courierList,
    Courier? courier,
    Enum? status,
  }) {
    return CourierState(
      courierList: courierList ?? this.courierList,
      courier: courier ?? this.courier,
      status: status ?? this.status,
    );
  }
}
