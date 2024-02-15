// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courier_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourierResponseModel _$CourierResponseModelFromJson(
  Map<String, dynamic> json,
) =>
    CourierResponseModel(
      message: json['message'] as String?,
      couriers: (json['couriers'] as List<dynamic>?)
          ?.map((e) => CourierModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourierResponseModelToJson(
  CourierResponseModel instance,
) =>
    <String, dynamic>{
      'message': instance.message,
      'couriers': instance.couriers,
    };
