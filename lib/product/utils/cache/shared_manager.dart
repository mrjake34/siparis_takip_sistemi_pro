import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/enums/enums.dart';

class SharedManager {
  SharedManager._();
  static final SharedManager _instance = SharedManager._();
  SharedPreferences? _preferences;
  static SharedManager get instance => _instance;

  Future<void> preferencesInit() async =>
      instance._preferences ??= await SharedPreferences.getInstance();

  Future<void> clearAll() async {
    await _preferences!.clear();
  }

  Future<void> removeFromKey(PreferenceKey key) async {
    await _preferences?.remove(key.name);
  }

  Future<void> setStringValue(PreferenceKey key, String value) async {
    await _preferences?.setString(key.name, value);
  }

  Future<void> setBoolValue(PreferenceKey key, {bool? value}) async {
    await _preferences?.setBool(key.name, value ?? false);
  }

  String getStringValue(PreferenceKey key) =>
      _preferences?.getString(key.name) ?? '';
  bool getBoolValue(PreferenceKey key) =>
      _preferences?.getBool(key.name) ?? false;
}
