// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_respose_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseModel<T> _$BaseResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponseModel<T>(
      status: $enumDecodeNullable(_$NetworkStatusEnumMap, json['status']),
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$BaseResponseModelToJson<T>(
  BaseResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': _$NetworkStatusEnumMap[instance.status],
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

const _$NetworkStatusEnumMap = {
  NetworkStatus.emailAlreadyExists: 'emailAlreadyExists',
  NetworkStatus.phoneAlreadyExists: 'phoneAlreadyExists',
  NetworkStatus.shopNameAlreadyExists: 'shopNameAlreadyExists',
  NetworkStatus.passwordNotMatch: 'passwordNotMatch',
  NetworkStatus.unknownError: 'unknownError',
  NetworkStatus.userNotFound: 'userNotFound',
  NetworkStatus.wrongPassword: 'wrongPassword',
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
