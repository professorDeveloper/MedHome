import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static SharedPreferences? _prefs;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  //sets
  static Future<bool?> setBool(String key, bool value) async => await _prefs?.setBool(key, value);

  static Future<bool?> setDouble(String key, double value) async => await _prefs?.setDouble(key, value);

  static Future<bool?> setInt(String key, int value) async => await _prefs?.setInt(key, value);

  static Future<bool?> setAccessToken( String value) async => await _prefs?.setString("accessToken", value);
  static Future<bool?> setAgreePrivacyPolicy( bool value) async => await _prefs?.setBool("privacyPolicy", value);
  static Future<bool?> setRefreshToken( String value) async => await _prefs?.setString("refreshToken", value);
  static Future<bool?> setUserPhone( String value) async => await _prefs?.setString("userPhone", value);
  static Future<bool?> setUserPassword( String value) async => await _prefs?.setString("userPassword", value);

  static Future<bool?> setStringList(String key, List<String> value) async => await _prefs?.setStringList(key, value);

  // gets
  static bool? getBool(String key) => _prefs?.getBool(key);

  static double? getDouble(String key) => _prefs?.getDouble(key);

  static int? getInt(String key) => _prefs?.getInt(key);

  static String? getAccessToken() => _prefs?.getString("accessToken");
  static Future<bool?> getPrivacyPolicy() async =>await _prefs?.getBool("privacyPolicy");
  static String? getRefreshToken() => _prefs?.getString("refreshToken");
  static String? getUserPhone() => _prefs?.getString("userPhone");
  static String? getUserPassword() => _prefs?.getString("userPassword");

  static List<String>? getStringList(String key) => _prefs?.getStringList(key);

  //deletes..
  static Future<bool?> remove(String key) async => await _prefs?.remove(key);

  static Future<bool?> clear() async => await _prefs?.clear();
}
