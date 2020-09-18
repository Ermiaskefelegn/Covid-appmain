import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myapp1/layout_pages/springboardpage.dart';
import 'package:myapp1/layout_pages/theme.dart';
import 'package:myapp1/localizations/languages.dart';
import 'package:myapp1/localizations/localization_constant.dart';
import 'package:provider/provider.dart';

int min;

const peroidicnotification = "basicnotification";

Future<void> main() async {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData.light()),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatefulWidget {
  @override
  _MaterialAppWithThemeState createState() => _MaterialAppWithThemeState();

  static void setLocale(BuildContext context, Locale locale) {
    _MaterialAppWithThemeState state =
        context.findAncestorStateOfType<_MaterialAppWithThemeState>();
    state.setLocale(locale);
  }
}

class _MaterialAppWithThemeState extends State<MaterialAppWithTheme> {
  Locale _locale;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocal().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      locale: _locale,
      supportedLocales: [
        Locale('en', 'US'),
        Locale('aa', 'ET'),
        Locale('am', 'ET'),
        Locale('orm', 'ET'),
        Locale('so', 'ET'),
        Locale('ti', 'ET'),
        Locale('ar', 'SA')
      ],
      localizationsDelegates: [
        Mylocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale.languageCode &&
              locale.countryCode == deviceLocale.countryCode) {
            return deviceLocale;
          }
        }
        return supportedLocales.first;
      },
      home: Springboardpage(),
      theme: theme.getTheme(),
    );
  }
}
