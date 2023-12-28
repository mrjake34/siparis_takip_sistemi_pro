import 'package:equatable/equatable.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/data_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/mixin/headers_mixin.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/mixin/status_mixin.dart';

abstract class IBaseResponseModel<T> extends Equatable
    with HeadersMixin, StatusMixin
    implements IDataModel<T> {}
