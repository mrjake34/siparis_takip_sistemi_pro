// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'courier_bloc.dart';

class CourierState extends Equatable {
  const CourierState({
    this.courierList,
    this.courierModel,
    this.status,
    this.isPasswordVisible,
    this.isPasswordAgainVisible,
  });
  final List<CourierModel>? courierList;
  final CourierModel? courierModel;
  final Status? status;
  final bool? isPasswordVisible;
  final bool? isPasswordAgainVisible;

  @override
  List<Object?> get props => [
        status,
        courierModel,
        courierList,
        isPasswordVisible,
        isPasswordAgainVisible,
      ];

  CourierState copyWith({
    List<CourierModel>? courierList,
    CourierModel? courierModel,
    Status? status,
    bool? isPasswordVisible,
    bool? isPasswordAgainVisible,
  }) {
    return CourierState(
      courierList: courierList ?? this.courierList,
      courierModel: courierModel ?? this.courierModel,
      status: status ?? this.status,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isPasswordAgainVisible:
          isPasswordAgainVisible ?? this.isPasswordAgainVisible,
    );
  }
}
