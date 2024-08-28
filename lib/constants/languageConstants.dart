import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
const String LANGUAGE_CODE = 'languageCode';

//languages code
const String English = 'en';
const String VietNamese = 'vi';

Future<Locale> setLocale(String langagueCode) async{
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, langagueCode);
  return _locale(langagueCode);
}

Future<Locale> getLocale() async{
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? English;
  return _locale(languageCode);
}

Locale _locale(String languageCode){
  switch(languageCode){
    case English:
      return const Locale(English, '');
    case VietNamese:
      return const Locale(VietNamese,'');
    default:
      return const Locale(English, '');
  }
}

AppLocalizations translation(BuildContext context){
  return AppLocalizations.of(context)!;
}


// select language

