import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';

import '../interface/interface_base_error_model.dart';

final class NetworkErrorModel implements IBaseErrorModel {
  NetworkErrorModel({
    required this.error,
  });
  factory NetworkErrorModel.getStatus(String message) {
    return NetworkErrorModel(
      error: NetworkStatus.getStatus(message),
    );
  }

  @override
  NetworkStatus error;
}
