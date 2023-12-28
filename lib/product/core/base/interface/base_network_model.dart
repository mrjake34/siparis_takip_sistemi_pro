import 'package:equatable/equatable.dart';

abstract class IBaseNetworkModel<T> extends Equatable {
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic>? toJson();
}
