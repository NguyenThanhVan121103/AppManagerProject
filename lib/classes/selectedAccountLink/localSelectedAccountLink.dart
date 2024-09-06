import 'package:shared_preferences/shared_preferences.dart';

class LocalSelectedAccountLink{
  static late SharedPreferences _preferencesFaceBook;
  static late SharedPreferences _preferencesGoogle;

  static const _keySelectFacebook = "isSelect";
  static const _keySelectGoogle = "isSelect";

  static Future init() async {
    _preferencesFaceBook= await SharedPreferences.getInstance();
    _preferencesGoogle = await SharedPreferences.getInstance();
  }

  static Future setSelectedFacebook(bool isSelected) async =>
      await _preferencesFaceBook.setBool(_keySelectFacebook, isSelected);

  static bool? getSelectedFacebook() => _preferencesFaceBook.getBool(_keySelectFacebook);


  static Future setSelectedGoogle(bool isSelected) async =>
      await _preferencesGoogle.setBool(_keySelectGoogle, isSelected);

  static bool? getSelectedGoogle() => _preferencesGoogle.getBool(_keySelectGoogle);
}