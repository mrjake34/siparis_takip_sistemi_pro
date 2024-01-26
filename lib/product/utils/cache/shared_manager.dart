import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/model/user_model.dart';

import '../../core/constants/enums/enums.dart';

final class SharedManager {
  SharedManager._();
  static final SharedManager _instance = SharedManager._();
  static SharedManager get instance => _instance;

  Future<void> preferencesInit() async {
    final dir = (await getApplicationDocumentsDirectory()).path;
    Hive.defaultDirectory = dir;
    Hive.registerAdapter(
      PreferenceKey.userModel.name,
      (json) => UserModel.fromJson(json as Map<String, dynamic>),
    );
  }

  bool removeFromKey<T>(PreferenceKey key) {
    final box = Hive.box<T>(name: key.name);
    return box.delete(key.name);
  }

  void set<T>(PreferenceKey key, T value) {
    final box = Hive.box<T>(name: key.name);
    return box.put(key.name, value);
  }

  T? get<T>(PreferenceKey key) {
    final box = Hive.box<T>(name: key.name);
    final value = box.get(key.name);
    if (value == null) return null;
    return value as T;
  }

  void saveModel({UserModel? model}) {
    if (model == null) return;
    final box = Hive.box<UserModel>(name: PreferenceKey.userModel.name);
    return box.put(
      PreferenceKey.userModel.name,
      model,
    );
  }

  UserModel? getModel() {
    final box = Hive.box<UserModel>(name: PreferenceKey.userModel.name);
    final model = box.get(
      PreferenceKey.userModel.name,
    );
    if (model == null) return null;
    return model;
  }

  bool clearSavedModel() {
    final box = Hive.box<UserModel>(name: PreferenceKey.userModel.name);
    return box.delete(PreferenceKey.userModel.name);
  }
}
