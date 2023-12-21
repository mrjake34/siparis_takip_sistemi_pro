import 'package:shared_preferences/shared_preferences.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/model/user.dart';

import '../../core/constants/enums/enums.dart';

class SharedManager {
  SharedManager._();
  static final SharedManager _instance = SharedManager._();
  SharedPreferences? _preferences;
  static SharedManager get instance => _instance;

  Future<SharedPreferences> preferencesInit() async =>
      instance._preferences ??= await SharedPreferences.getInstance();

  Future<bool> clearSavedModel() async {
    final result = await _preferences?.remove(PreferenceKey.userModel.name);
    return result ?? false;
  }

  Future<bool> removeFromKey(PreferenceKey key) async {
    final result = await _preferences?.remove(key.name);
    return result ?? false;
  }

  Future<bool> setStringValue(PreferenceKey key, String value) async {
    final result = await _preferences?.setString(key.name, value);
    return result ?? false;
  }

  Future<bool> setBoolValue(PreferenceKey key, {bool? value}) async {
    final result = await _preferences?.setBool(key.name, value ?? false);
    return result ?? false;
  }

  Future<bool> saveModel<T>({User? model}) async {
    if (model == null) {
      return false;
    }
    final result = await _preferences?.setString(
      PreferenceKey.userModel.name,
      model.toJson().toString(),
    );
    return result ?? false;
  }

  String getStringValue(PreferenceKey key) =>
      _preferences?.getString(key.name) ?? '';
  bool getBoolValue(PreferenceKey key) =>
      _preferences?.getBool(key.name) ?? false;
}
