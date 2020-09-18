import 'package:flutter/cupertino.dart';
import 'package:myapp1/localizations/languages.dart';
import 'package:shared_preferences/shared_preferences.dart';

String translated(BuildContext context, String key) {
  return Mylocalization.of(context).getTranslatedValue(key);
}

const String English = 'en';
const String Amharic = 'am';
const String Oromiffa = 'orm';
const String Tigrigna = 'ti';
const String Soomalii = 'so';
const String Afar = 'aa';
const String Arabic = 'ar';

const String Language_Code = 'languageCode';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences preference = await SharedPreferences.getInstance();
  await preference.setString(Language_Code, languageCode);

  return locale(languageCode);
}

Future<Locale> getLocal() async {
  SharedPreferences preference = await SharedPreferences.getInstance();
  String languagecode = preference.getString(Language_Code) ?? English;
  return locale(languagecode);
}

Locale locale(String languageCode) {
  Locale _temp;
  switch (languageCode) {
    case English:
      _temp = Locale(languageCode, 'US');
      break;
    case Arabic:
      _temp = Locale(languageCode, 'SU');
      break;
    case Tigrigna:
      _temp = Locale(languageCode, 'ET');
      break;
    case Soomalii:
      _temp = Locale(languageCode, 'ET');
      break;
    case Afar:
      _temp = Locale(languageCode, 'ET');
      break;
    case Amharic:
      _temp = Locale(languageCode, 'ET');
      break;
    case Oromiffa:
      _temp = Locale(languageCode, 'ET');
      break;
    default:
      _temp = Locale(languageCode, 'US');
  }
  return _temp;
}
