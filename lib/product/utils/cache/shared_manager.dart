import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/model/user.dart';

import '../../core/constants/enums/enums.dart';

final class SharedManager {
  SharedManager._();
  static final SharedManager _instance = SharedManager._();
  static SharedManager get instance => _instance;

  AndroidOptions get _androidOptions => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  IOSOptions get _iosOptions => const IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
      );

  late final FlutterSecureStorage _storage;

  Future<void> preferencesInit() async {
    _storage = FlutterSecureStorage(
      aOptions: _instance._androidOptions,
      iOptions: _instance._iosOptions,
    );
  }

  Future<bool> clearSavedModel() async {
    try {
      await _storage.delete(key: PreferenceKey.userModel.name);
    } catch (_) {
      return false;
    }
    return true;
  }

  Future<void> removeFromKey(PreferenceKey key) async {
    await _storage.delete(key: key.name);
  }

  Future<void> setStringValue(PreferenceKey key, String value) async {
    await _storage.write(key: key.name, value: value);
  }

  Future<void> setBoolValue(PreferenceKey key, {bool? value}) async {
    await _storage.write(key: key.name, value: value.toString());
  }

  Future<void> saveModel({User? model}) async {
    if (model == null) return;

    await _storage.write(
      key: PreferenceKey.userModel.name,
      value: model.toJson().toString(),
    );
  }

  Future<User?> getModel() async {
    final model = await _storage.read(key: PreferenceKey.userModel.name);
    if (model == null) return null;
    final decodedModel = jsonDecode(model);
    return User.fromJson(decodedModel as Map<String, dynamic>);
  }

  Future<String> getStringValue(PreferenceKey key) async =>
      await _storage.read(key: key.name) ?? '';
}
