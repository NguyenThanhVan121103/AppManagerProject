import 'package:shared_preferences/shared_preferences.dart';

class LocalSelectedLanguage{
  static late SharedPreferences _preferences;
  static const _keyLanguage = "index";
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setSetlectedLanguage(int index) async =>
      await _preferences.setInt(_keyLanguage, index);

  static int? getSetlectedLanguage() => _preferences.getInt(_keyLanguage);

}