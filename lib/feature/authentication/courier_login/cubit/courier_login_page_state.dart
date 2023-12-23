// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'courier_login_page_cubit.dart';

final class CourierLoginPageState extends Equatable {
  const CourierLoginPageState({
    this.status,
    this.networkStatus,
    this.errorMessage,
  });
  final Status? status;
  final NetworkStatus? networkStatus;
  final String? errorMessage;

  @override
  List<Object?> get props => [status, networkStatus, errorMessage];

  CourierLoginPageState copyWith({
    Status? status,
    NetworkStatus? networkStatus,
    String? errorMessage,
  }) {
    return CourierLoginPageState(
      status: status ?? this.status,
      networkStatus: networkStatus ?? this.networkStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
