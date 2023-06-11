// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'courier_login_page_cubit.dart';

class CourierLoginPageState extends Equatable {
  const CourierLoginPageState({this.status});
  final Enum? status;

  @override
  List<Object> get props => [status.toString()];

  CourierLoginPageState copyWith({
    Enum? status,
  }) {
    return CourierLoginPageState(
      status: status ?? this.status,
    );
  }
}
