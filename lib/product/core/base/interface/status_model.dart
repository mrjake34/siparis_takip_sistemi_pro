import '../../constants/enums/network_status.dart';

abstract class IStatusModel {
  NetworkStatus? networkStatus;
  NetworkStatus getStatus(String value);
  NetworkStatus getStatusFromCode(int code);
}
