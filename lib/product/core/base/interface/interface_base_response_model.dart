import 'package:equatable/equatable.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/data_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/status_model.dart';

import 'headers_model.dart';
import 'interface_base_error_model.dart';

abstract class IBaseResponseModel<T> extends Equatable
    implements IBaseErrorModel, IBaseHeaderModel, IDataModel<T>, IStatusModel {}
