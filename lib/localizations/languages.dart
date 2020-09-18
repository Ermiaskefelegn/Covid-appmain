import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Mylocalization {
  Mylocalization(this.locale);

  final Locale locale;

  static Mylocalization of(BuildContext context) {
    return Localizations.of<Mylocalization>(context, Mylocalization);
  }

  Map<String, String> _localizedValues;

  Future load() async {
    String jsonStringValues = await rootBundle
        .loadString('lib/localizations/${locale.languageCode}.json');

    Map<String, dynamic> mappedJason = json.decode(jsonStringValues);

    _localizedValues =
        mappedJason.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslatedValue(String key) {
    return _localizedValues[key];
  }

  static const LocalizationsDelegate<Mylocalization> delegate =
      _MylocalizationDelegate();
}

class _MylocalizationDelegate extends LocalizationsDelegate<Mylocalization> {
  const _MylocalizationDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['en', 'aa', 'am', 'orm', 'so', 'ti', 'ar']
        .contains(locale.languageCode);
  }

  @override
  Future<Mylocalization> load(Locale locale) async {
    Mylocalization mylocalization = new Mylocalization(locale);
    await mylocalization.load();
    return mylocalization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<Mylocalization> old) => false;
}
