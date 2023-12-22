import '../../constants/enums/network_status.dart';

abstract class IBaseResponseModel<T> {
  IBaseResponseModel<T> fromJson(Map<String, dynamic> json);
  Map<String, dynamic>? toJson();
  T? data;
  int? statusCode;
  Map<String, List<dynamic>>? headers;
  NetworkStatus? networkStatus;
}
