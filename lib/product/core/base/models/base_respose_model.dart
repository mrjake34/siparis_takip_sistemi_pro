import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_enums.dart';

part 'base_respose_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: true,
  genericArgumentFactories: true,
)
@immutable

/// Base response model for all api responses
final class BaseResponseModel<T> extends Equatable {
  /// Base response model contructor method
  const BaseResponseModel({
    this.status,
    this.data,
  });

  /// Base response model from json method
  /// it takes json and returns base response model
  factory BaseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseModelFromJson(json, (json) => json as T);
  final NetworkStatus? status;
  final T? data;

  Map<String, dynamic> toJson() =>
      _$BaseResponseModelToJson(this, (value) => value);

  @override
  List<Object?> get props => [status, data];
}
