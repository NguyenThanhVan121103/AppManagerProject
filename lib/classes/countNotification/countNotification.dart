
import 'package:shared_preferences/shared_preferences.dart';

class LocalCountNotification {
  static late SharedPreferences _preferences;
  static const _keycountNoti = "countNoti";

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setCountNoti(int count) async =>
      await _preferences.setInt(_keycountNoti, count);

  static int? getCountNoti() => _preferences.getInt(_keycountNoti);
}

class DateOldNotification {
  static late SharedPreferences _preferences;
  static const _keyDateNoti = "dateNoti";

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setDateNoti(String dateTime) async =>
      await _preferences.setString(_keyDateNoti, dateTime);

  static String? getDateNoti() => _preferences.getString(_keyDateNoti);
}