import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();

    return _prefs;
  }

  ///save data to prefFile
  static Future<bool> setString(String key, String value) {

    return _prefs.setString(key, value);
  }

  static Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  static Future<bool> setBool(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  static Future<bool> setStringList(String key, List<String> value) {
    return _prefs.setStringList(key, value);
  }

  ///get values from prefFile
  static String? getString(String key) {
    return _prefs.getString(key);
  }


  static bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  static List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }
}
