import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';

import '../../../../product/core/base/models/update_model.dart';
import '../model/user.dart';

abstract class IProfileService {
  Future<BaseResponseModel<T>> getProfile<T>();
  Future<BaseResponseModel<T>> updateProfile<T>(
    UpdateModel<dynamic>? model,
    String id,
  );
}
