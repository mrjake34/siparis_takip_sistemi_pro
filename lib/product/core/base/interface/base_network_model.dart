import 'package:equatable/equatable.dart';

abstract class IBaseNetworkModel<T> extends Equatable {
  Map<String, dynamic>? toJson();
  T fromJson(Map<String, dynamic> json);
}
