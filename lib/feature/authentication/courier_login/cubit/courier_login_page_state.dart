// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'courier_login_page_cubit.dart';

final class CourierLoginPageState extends Equatable {
  const CourierLoginPageState({
    this.status,
    this.networkStatus,
    this.errorMessage,
    this.isPasswordVisible,
  });
  final Status? status;
  final NetworkStatus? networkStatus;
  final String? errorMessage;
  final bool? isPasswordVisible;

  @override
  List<Object?> get props => [
        status,
        networkStatus,
        errorMessage,
        isPasswordVisible,
      ];

  CourierLoginPageState copyWith({
    Status? status,
    NetworkStatus? networkStatus,
    String? errorMessage,
    bool? isPasswordVisible,
  }) {
    return CourierLoginPageState(
      status: status ?? this.status,
      networkStatus: networkStatus ?? this.networkStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}
