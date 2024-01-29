import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesManager {
  SharedPreferences? preferences;

  SharedPrefrencesManager._privateConstructor();

  static final SharedPrefrencesManager _instance =
      SharedPrefrencesManager._privateConstructor();

  factory SharedPrefrencesManager() {
    return _instance;
  }

  Future<void> initSharedPrefrences() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveString(String key, String value) async {
    await preferences?.setString(key, value);
  }

  Future<void> saveInt(String key, int value) async {
    await preferences?.setInt(key, value);
  }

  Future<void> saveBool(String key, bool value) async {
    await preferences?.setBool(key, value);
  }

  String? getString(String key) {
    return preferences?.getString(key);
  }

  int? getInt(String key) {
    return preferences?.getInt(key);
  }

  bool? getBool(String key) {
    return preferences?.getBool(key);
  }

  Future<void> removeKey(String key) async {
    await preferences?.remove(key);
  }
}
