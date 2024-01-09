import 'package:siparis_takip_sistemi_pro/product/utils/cache/shared_manager.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';

import '../../feature/screens/profile/model/user_model.dart';

extension UserModelExtension on UserModel? {
  UserModelExtensionClass get exten => UserModelExtensionClass(this);
}

final class UserModelExtensionClass {
  const UserModelExtensionClass(UserModel? value) : _value = value;

  final UserModel? _value;

  static SharedManager get _sharedManager => ProductItems.sharedManager;

  Future<void> saveModel() async {
    if (_value == null) return;
    await _sharedManager.saveModel(model: _value);
  }
}
