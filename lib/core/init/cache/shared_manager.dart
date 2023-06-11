import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/enums/enums.dart';

class SharedManager {
  SharedManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }
  static final SharedManager _instance = SharedManager._init();
  SharedPreferences? _preferences;
  static SharedManager get instance => _instance;

  static preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> clearAll() async {
    await _preferences!.clear();
  }

  Future<void> setStringValue(PreferenceKey key, String value) async {
    await _preferences?.setString(key.toString(), value);
  }

  Future<void> setBoolValue(PreferenceKey key, bool value) async {
    await _preferences?.setBool(key.toString(), value);
  }

  String getStringValue(PreferenceKey key) =>
      _preferences?.getString(key.toString()) ?? "";
  bool getBoolValue(PreferenceKey key) =>
      _preferences?.getBool(key.toString()) ?? false;
}
