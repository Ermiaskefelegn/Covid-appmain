import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp1/bloc/navigation_bloc.dart';
import 'package:myapp1/layout_pages/dialogue_settigns.dart';
import 'package:myapp1/layout_pages/theme.dart';
import 'package:myapp1/localizations/localization_constant.dart';
import 'package:provider/provider.dart';
import 'package:myapp1/pages/settings.dart';

class Menu extends StatefulWidget {
  final Animation<Offset> slideAnimation;
  final Animation<double> menuAnimation;
  final int selectedIndex;
  final onMenuitemselected;
  final onchanged;
  final valueV;
  const Menu(
      {Key key,
      this.slideAnimation,
      this.menuAnimation,
      this.selectedIndex,
      @required this.onMenuitemselected,
      @required this.onchanged,
      this.valueV})
      : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool menuisclosed = false;
  int _periodicminute = 0;
  int starthour = 0, endhour = 0, endmin = 0, startmin, min1 = 0;
  bool isLightOn = true;
  Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1),
        (Timer t) => getminuteprefernce().then(updateminiute));
    timer = Timer.periodic(Duration(seconds: 1),
        (Timer t) => getstarthour().then(updatestarthour));
    timer = Timer.periodic(
        Duration(seconds: 1), (Timer t) => getstartmin().then(updatestartmin));
    timer = Timer.periodic(
        Duration(seconds: 1), (Timer t) => getendhour().then(updateenhour));
    timer = Timer.periodic(
        Duration(seconds: 1), (Timer t) => getendmin().then(updateendmin));
    timer = Timer.periodic(Duration(seconds: 1),
        (Timer t) => getminuteprefernce2().then(updatmin));
    super.initState();
  }

  void updateminiute(int miniute) {
    if (mounted) {
      setState(() {
        this._periodicminute = miniute ?? 15;
      });
    }
  }

  void updatestarthour(int starth) {
    if (mounted) {
      setState(() {
        this.starthour = starth ?? 0;
      });
    }
  }

  void updatestartmin(int startm) {
    if (mounted) {
      setState(() {
        this.startmin = startm ?? 0;
      });
    }
  }

  void updateenhour(int endh) {
    if (mounted) {
      setState(() {
        this.endhour = endh ?? 0;
      });
    }
  }

  void updateendmin(int endm) {
    if (mounted) {
      setState(() {
        this.endmin = endm ?? 0;
      });
    }
  }

  void updatmin(int min) {
    if (mounted) {
      setState(() {
        this.min1 = min ?? 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return WillPopScope(
      onWillPop: () async {
        widget.onMenuitemselected();
        return Future.value(false);
      },
      child: SlideTransition(
        position: widget.slideAnimation,
        child: ScaleTransition(
          scale: widget.menuAnimation,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Customedialog();
                        });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 30,
                          child: Image.asset('assets/ic_launcher.png'),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(translated(context, 'notifyme') +
                                "$_periodicminute"),
                            Text(translated(context, 'notifiction_start') +
                                '$starthour:$startmin - $endhour:$endmin'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 120),
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            BlocProvider.of<NavigationBloc>(context)
                                .add(NavigationEvents.DashboardClickEvent);
                            widget.onMenuitemselected();
                          },
                          child: Container(
                            color: Colors.transparent,
                            height: MediaQuery.of(context).size.height / 14,
                            margin: EdgeInsets.only(
                              left: 15,
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.home,
                                  color: widget.selectedIndex == 0
                                      ? Colors.cyan
                                      : Colors.blueGrey,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(translated(context, 'home_page'),
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: widget.selectedIndex == 0
                                            ? Colors.cyan
                                            : Colors.blueGrey,
                                        fontWeight: widget.selectedIndex == 0
                                            ? FontWeight.w900
                                            : FontWeight.normal)),
                              ],
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            BlocProvider.of<NavigationBloc>(context)
                                .add(NavigationEvents.CovidClickEvent);
                            widget.onMenuitemselected();
                          },
                          child: Container(
                            color: Colors.transparent,
                            height: MediaQuery.of(context).size.height / 14,
                            margin: EdgeInsets.only(
                              left: 15,
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.questionCircle,
                                  color: widget.selectedIndex == 1
                                      ? Colors.cyan
                                      : Colors.blueGrey,
                                ),
                                SizedBox(width: 10),
                                Text(translated(context, 'faq'),
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: widget.selectedIndex == 1
                                            ? Colors.cyan
                                            : Colors.blueGrey,
                                        fontWeight: widget.selectedIndex == 1
                                            ? FontWeight.w900
                                            : FontWeight.normal)),
                              ],
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            BlocProvider.of<NavigationBloc>(context)
                                .add(NavigationEvents.HelpClickEvent);
                            widget.onMenuitemselected();
                          },
                          child: Container(
                            color: Colors.transparent,
                            height: MediaQuery.of(context).size.height / 14,
                            margin: EdgeInsets.only(
                              left: 15,
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.directions,
                                  color: widget.selectedIndex == 3
                                      ? Colors.cyan
                                      : Colors.blueGrey,
                                ),
                                SizedBox(width: 10),
                                Text(translated(context, 'help'),
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: widget.selectedIndex == 3
                                            ? Colors.cyan
                                            : Colors.blueGrey,
                                        fontWeight: widget.selectedIndex == 3
                                            ? FontWeight.w900
                                            : FontWeight.normal)),
                              ],
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            BlocProvider.of<NavigationBloc>(context)
                                .add(NavigationEvents.AboutClickEvent);
                            widget.onMenuitemselected();
                          },
                          child: Container(
                            color: Colors.transparent,
                            height: MediaQuery.of(context).size.height / 14,
                            margin: EdgeInsets.only(
                              left: 15,
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.people,
                                  color: widget.selectedIndex == 4
                                      ? Colors.cyan
                                      : Colors.blueGrey,
                                ),
                                SizedBox(width: 10),
                                Text(translated(context, 'about_us'),
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: widget.selectedIndex == 4
                                            ? Colors.cyan
                                            : Colors.blueGrey,
                                        fontWeight: widget.selectedIndex == 4
                                            ? FontWeight.w900
                                            : FontWeight.normal)),
                              ],
                            ),
                          )),
                      isLightOn
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  _themeChanger.setTheme(ThemeData.dark());
                                  isLightOn = false;
                                });
                              },
                              child: Container(
                                color: Colors.transparent,
                                height: MediaQuery.of(context).size.height / 14,
                                margin: EdgeInsets.only(
                                  left: 15,
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.lightbulb,
                                        color: Colors.grey),
                                    SizedBox(width: 10),
                                    Text(translated(context, 'dark_mode'),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.grey,
                                        )),
                                  ],
                                ),
                              ))
                          : GestureDetector(
                              onTap: () {
                                setState(() {
                                  _themeChanger.setTheme(ThemeData.light());
                                  isLightOn = true;
                                });
                              },
                              child: Container(
                                color: Colors.transparent,
                                height: MediaQuery.of(context).size.height / 14,
                                margin: EdgeInsets.only(
                                  left: 15,
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.solidLightbulb,
                                        color: Colors.yellowAccent),
                                    SizedBox(width: 10),
                                    Text(translated(context, 'light_mode'),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.yellowAccent,
                                        )),
                                  ],
                                ),
                              )),
                    ],
                  ),
                ),
                Row(children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(NavigationEvents.SettingsClickEvent);
                      widget.onMenuitemselected();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      color: Colors.transparent,
                      height: MediaQuery.of(context).size.height / 14,
                      margin: EdgeInsets.only(
                        left: 15,
                      ),
                      child: Row(children: <Widget>[
                        Icon(
                          Icons.settings,
                          color: widget.selectedIndex == 5
                              ? Colors.cyan
                              : Colors.blueGrey,
                        ),
                        SizedBox(width: 10),
                        Text(translated(context, 'settings'),
                            style: TextStyle(
                                fontSize: 18,
                                color: widget.selectedIndex == 5
                                    ? Colors.cyan
                                    : Colors.blueGrey,
                                fontWeight: widget.selectedIndex == 5
                                    ? FontWeight.w900
                                    : FontWeight.normal)),
                      ]),
                    ),
                  ),
                  Container(
                    color: Colors.blueGrey,
                    height: 20,
                    width: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      exit(0);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      color: Colors.transparent,
                      height: MediaQuery.of(context).size.height / 14,
                      margin: EdgeInsets.only(
                        left: 15,
                      ),
                      child: Row(children: <Widget>[
                        Icon(Icons.exit_to_app, color: Colors.red),
                        SizedBox(width: 10),
                        Text(translated(context, 'exit'),
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                                fontWeight: FontWeight.normal)),
                      ]),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
