import 'package:siparis_takip_sistemi_pro/product/utils/cache/shared_manager.dart';

import '../../feature/screens/profile/model/user_model.dart';

extension UserModelExtension on UserModel? {
  UserModelExtensionClass get exten => UserModelExtensionClass(this);
}

final class UserModelExtensionClass {
  const UserModelExtensionClass(UserModel? value) : _value = value;

  final UserModel? _value;

  static SharedManager get _sharedManager => SharedManager.instance;

  void saveModel() {
    if (_value == null) return;
    _sharedManager.saveModel(model: _value);
  }
}
