import 'package:shared_preferences/shared_preferences.dart';

class LocalLastDayOldNoti {
  static late SharedPreferences _preferences;
  static const _keyDayNoti = "dayNoti";

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setLastDayNoti(String dateTime) async =>
      await _preferences.setString(_keyDayNoti, dateTime);

  static String? getLastDayNoti() =>
      _preferences.getString(_keyDayNoti);
}