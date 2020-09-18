import 'dart:async';
import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp1/LocalNotification.dart';
import 'package:myapp1/bloc/navigation_bloc.dart';
import 'package:myapp1/layout_pages/FadePageRoute.dart';
import 'package:myapp1/layout_pages/case_layout.dart';
import 'package:myapp1/pages/settings.dart';
import 'package:myapp1/layout_pages/pageviewlayout.dart';
import 'package:myapp1/layout_pages/phone_carousel.dart';
import 'package:myapp1/localizations/language.dart';
import 'package:myapp1/localizations/localization_constant.dart';
import 'package:myapp1/pages/FaceMasktips.dart';
import 'package:myapp1/pages/Howtotakecrepatients.dart';
import 'package:myapp1/pages/Prevention.dart';
import 'package:myapp1/pages/SaftyinTransport.dart';
import 'package:myapp1/pages/symptomes.dart';
import 'package:myapp1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

const peroidicnotification = "basicnotification";
void callbackDispatcher() {
  Workmanager.executeTask((peroidicnotification, inputData) async {
    FlutterLocalNotificationsPlugin flp = FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    var initSettings = new InitializationSettings(android, iOS);
    flp.initialize(initSettings);
    periodicnotification(flp);
    return Future.value(true);
  });
}

Future<void> periodicnotification(flp) async {
  var android = new AndroidNotificationDetails(
      'channel id_main', 'channel NAME_main', 'CHANNEL DESCRIPTION_main',
      priority: Priority.High,
      importance: Importance.Max,
      timeoutAfter: 5000,
      playSound: true);
  var iOS = new IOSNotificationDetails();
  var platform = new NotificationDetails(android, iOS);

  await flp.show(
      0, 'የኮቪድ-19 አስታዋሽ መልዕክት', 'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ', platform,
      payload:
          'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ፤ሳኒታይዘር መጠቀሞን ወይም እጆዎን ይታጠቡ፤ርቀቶን መጠበቅም አይዘንጉ');
}

class MyCardsPage extends StatefulWidget with NavigationStates {
  final Function onMenuTap;
  final Function onMenuTapclosed;
  final bool isDrawerOpen;
  final onMenuitemselected;
  const MyCardsPage({
    Key key,
    this.onMenuTap,
    this.onMenuTapclosed,
    this.isDrawerOpen,
    this.onMenuitemselected,
  }) : super(key: key);

  @override
  _MyCardsPageState createState() => _MyCardsPageState();
}

class _MyCardsPageState extends State<MyCardsPage> {
  int count = 0;
  bool monday, tuesday, wednsday, thursday, friday, saturday, sunday;
  int starthour = 0, endhour = 0, endmin = 0, startmin, min1 = 0;
  int _periodicminute = 0;
  DateTime date = DateTime.now();
  Timer timer;
  bool isDrawerOpen = false;
  bool setNotificationon = true;
  Map ethiopiandata;
  @override
  void initState() {
    super.initState();
    //savecoviddata();

    super.initState();
    timer = Timer.periodic(Duration(seconds: 1),
        (Timer t) => getminuteprefernce().then(updateminiute));
    updateCoviddatalayout();
    notificationPlugin.setOnnotificationClick(onNotificationClick);
    getnotificationStatus();
    getmonday().then(updatemonday);
    gettuesday().then(updatetuesday);
    getwednsday().then(updatewednsday);
    getthursday().then(updatethursday);
    getfriday().then(updatefriday);
    getsatuday().then(updatesaturday);
    getsunuday().then(updatesunday);
    getstarthour().then(updatestarthour);
    getstartmin().then(updatestartmin);
    getendhour().then(updateenhour);
    getendmin().then(updateendmin);
  }

  void updatemonday(bool mon) {
    if (mounted) {
      setState(() {
        this.monday = mon ?? false;
      });
    }
  }

  void updatetuesday(bool tue) {
    if (mounted) {
      setState(() {
        this.tuesday = tue ?? false;
      });
    }
  }

  void updatewednsday(bool tue) {
    if (mounted) {
      setState(() {
        this.tuesday = tue ?? false;
      });
    }
  }

  void updatethursday(bool tue) {
    if (mounted) {
      setState(() {
        this.tuesday = tue ?? false;
      });
    }
  }

  void updatefriday(bool tue) {
    if (mounted) {
      setState(() {
        this.tuesday = tue ?? false;
      });
    }
  }

  void updatesaturday(bool tue) {
    if (mounted) {
      setState(() {
        this.tuesday = tue ?? false;
      });
    }
  }

  void updatesunday(bool tue) {
    if (mounted) {
      setState(() {
        this.tuesday = tue ?? false;
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

  void setnotification() {
    if (monday == true) {
      notificationPlugin.onMonatGeton();
      notificationPlugin.onMonatarrival();
      notificationPlugin.onMonatGetoff();
    }
    if (tuesday == true) {
      notificationPlugin.onTueatGeton();
      notificationPlugin.onTueatarrival();
      notificationPlugin.onTueatGetoff();
    }
    if (wednsday == true) {
      notificationPlugin.onWedatGeton();
      notificationPlugin.onWedatarrival();
      notificationPlugin.onWedatGetoff();
    }
    if (thursday == true) {
      notificationPlugin.onThuatGeton();
      notificationPlugin.onThuatarrival();
      notificationPlugin.onThuatGetoff();
    }
    if (friday == true) {
      notificationPlugin.onFriatGeton();
      notificationPlugin.onFriatarrival();
      notificationPlugin.onFriatGetoff();
    }
    if (saturday == true) {
      notificationPlugin.onSatatGeton();
      notificationPlugin.onSatatarrival();
      notificationPlugin.onSatatGetoff();
    }
    if (sunday == true) {
      notificationPlugin.onSunatGeton();
      notificationPlugin.onSunatarrival();
      notificationPlugin.onSunatGetoff();
    }
  }

  void getnotificationStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setNotificationon = (prefs.getBool('status') ?? true);
    print("setnotification status $setNotificationon");
  }

  void setnotificationStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('status', setNotificationon);
  }

  void updateminiute(int miniute) {
    if (mounted) {
      setState(() {
        this._periodicminute = miniute ?? 15;
      });
    }
  }

  void _changeLanguage(Language language) async {
    print(language.languagecode);
    Locale _temp = await setLocale(language.languagecode);

    MaterialAppWithTheme.setLocale(context, _temp);
  }

  void showNotification() {
    timer = new Timer.periodic(Duration(seconds: 5), (Timer timer) {
      notificationPlugin.notification();
    });
  }

  Future fetchethiopianData() async {
    http.Response response = await http
        .get('https://corona.lmao.ninja/v3/covid-19/countries/ethiopia');
    setState(() {
      ethiopiandata = json.decode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (BuildContext context) {
      return OfflineBuilder(
        connectivityBuilder: (BuildContext context,
            ConnectivityResult connectivity, Widget child) {
          final bool connected = connectivity != ConnectivityResult.none;
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              child,
              Positioned(
                  left: 0.0,
                  right: 0.0,
                  height: 30.0,
                  bottom: 2,
                  child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      color: connected
                          ? Colors.greenAccent.withOpacity(0.5)
                          : Colors.amberAccent.withOpacity(0.5),
                      child: connected
                          ? Center(
                              child: Text(translated(context, 'connected')))
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(translated(context, 'no_connection')),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 12,
                                  height: 12,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.0,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ),
                                )
                              ],
                            )))
            ],
          );
        },
        child: Stack(children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 78,
            ),
            child: RefreshIndicator(
              onRefresh: hundlerefresh,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ClipPath(
                          clipper: MyClipper(),
                          child: Container(
                              padding: EdgeInsets.only(top: 10),
                              height: 600,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0XFFAD9FE4).withOpacity(0.5),
                                  Colors.white.withOpacity(0.5)
                                ]),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 15, left: 20),
                                        child: Text(
                                          translated(context, 'question_home'),
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      setNotificationon
                                          ? IconButton(
                                              color: Colors.greenAccent,
                                              onPressed: () async {
                                                await notificationPlugin
                                                    .onSunatGeton();
                                                count = await notificationPlugin
                                                    .getpendingnotificationcaount();
                                                print('Count $count');
                                                setState(() {
                                                  // setnotification();
                                                  workmanagerinitializer();
                                                  // showNotification();
                                                  setNotificationon = false;
                                                  setnotificationStatus();
                                                });
                                              },
                                              icon: Icon(FontAwesomeIcons.bell))
                                          : IconButton(
                                              color: Colors.redAccent,
                                              onPressed: () {
                                                setState(() {
                                                  Workmanager.cancelAll();
                                                  setnotification();
                                                  notificationPlugin
                                                      .cancelNotification();
                                                  setNotificationon = true;
                                                  setnotificationStatus();
                                                });
                                              },
                                              icon: Icon(
                                                  FontAwesomeIcons.bellSlash))
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 5, left: 10, bottom: 5),
                                    child: Text(
                                      translated(context, 'question_home2'),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  Phonecarousel(),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2.3,
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.only(bottom: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color: Colors.transparent,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 20, bottom: 5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  translated(
                                                      context, 'covidreport'),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(DateFormat.MMMEd()
                                                        .format(date)
                                                        .toString()
                                                        .padLeft(2, '0') +
                                                    '/' +
                                                    date.year
                                                        .toString()
                                                        .padLeft(2, '0')),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Caselayout(
                                                ethethiopiandata: ethiopiandata,
                                                type:
                                                    translated(context, 'case'),
                                                dailyamount: casetoday,
                                                totaldetail: translated(
                                                    context, 'totalcase'),
                                                totalamount: totalcase,
                                                bgcolor: Colors.blueAccent
                                                    .withOpacity(0.5)
                                                    .withOpacity(0.7),
                                              ),
                                              Caselayout(
                                                type: translated(
                                                    context, 'recovery'),
                                                dailyamount: recovertoday,
                                                totaldetail: translated(
                                                    context, 'totalrecovery'),
                                                totalamount: totalrecover,
                                                bgcolor: Colors.greenAccent
                                                    .withOpacity(0.5),
                                              ),
                                              Caselayout(
                                                type: translated(
                                                    context, 'death'),
                                                dailyamount: deathtoday,
                                                totaldetail: translated(
                                                    context, 'totaldeath'),
                                                totalamount: totaldeath,
                                                bgcolor: Colors.redAccent
                                                    .withOpacity(0.5),
                                              )
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 20, top: 5, bottom: 5),
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  translated(context, 'test'),
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  totaltest,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 10, bottom: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                //color: Color(0XFFAD9FE4),
                                gradient: LinearGradient(colors: [
                                  Color(0XFFAD9FE4).withOpacity(0.5),
                                  Colors.white.withOpacity(0.5)
                                ]),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                translated(context, 'symptoms'),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.deepOrangeAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    FadePageRoute(widget: Symptomes()));
                              },
                              child: Container(
                                color: Colors.transparent,
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(4),
                                      child: Column(
                                        children: <Widget>[
                                          CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            backgroundImage:
                                                AssetImage('assets/fever.jpg'),
                                            radius: 56,
                                          ),
                                          Text(
                                            translated(context, 'fever'),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(4),
                                      child: Column(
                                        children: <Widget>[
                                          CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: AssetImage(
                                                'assets/dry cough.jpg'),
                                            radius: 56,
                                          ),
                                          Text(
                                            translated(context, 'cough'),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(4),
                                      child: Container(
                                        child: Column(
                                          children: <Widget>[
                                            CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              backgroundImage: AssetImage(
                                                  'assets/chestpain.jpg'),
                                              radius: 56,
                                            ),
                                            Text(
                                              translated(context, 'chestpain'),
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10, top: 10, bottom: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                //color: Color(0XFFAD9FE4),
                                gradient: LinearGradient(colors: [
                                  Color(0XFFAD9FE4).withOpacity(0.5),
                                  Colors.white.withOpacity(0.5)
                                ]),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                translated(context, 'tips'),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.deepOrangeAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.width / 1.9,
                              margin: EdgeInsets.only(bottom: 20),
                              child: PageView(
                                controller:
                                    PageController(viewportFraction: 0.8),
                                scrollDirection: Axis.horizontal,
                                pageSnapping: true,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          FadePageRoute(widget: FaceMask()));
                                    },
                                    child: Hero(
                                        tag: 'prev1',
                                        child: Pageviewlayout(
                                          pageviewimage:
                                              "assets/05_take_off-01.jpg",
                                          title:
                                              translated(context, 'facemask'),
                                        )),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          FadePageRoute(widget: Patientcare()));
                                    },
                                    child: Hero(
                                        tag: 'prev2',
                                        child: Pageviewlayout(
                                          pageviewimage: "assets/fatigue.jpg",
                                          title: translated(
                                              context, 'covid patients'),
                                        )),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          FadePageRoute(
                                              widget: SaftyinTransport()));
                                    },
                                    child: Hero(
                                        tag: 'prev3',
                                        child: Pageviewlayout(
                                          pageviewimage:
                                              "assets/keepdistance.jpg",
                                          title:
                                              translated(context, 'transport'),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context, FadePageRoute(widget: Prevention()));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10, bottom: 5),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  //color: Color(0XFFAD9FE4),
                                  gradient: LinearGradient(colors: [
                                    Color(0XFFAD9FE4).withOpacity(0.5),
                                    Colors.white.withOpacity(0.5)
                                  ]),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  translated(context, 'prevention'),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      height: 120,
                                      width: MediaQuery.of(context).size.width /
                                          3.3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                      margin: EdgeInsets.only(
                                          top: 10,
                                          bottom: 20,
                                          right: 5,
                                          left: 5),
                                      child:
                                          Image.asset("assets/stayhome.jpg")),
                                  Container(
                                      height: 120,
                                      width: MediaQuery.of(context).size.width /
                                          3.3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                      margin: EdgeInsets.only(
                                          top: 10,
                                          bottom: 20,
                                          right: 5,
                                          left: 5),
                                      child:
                                          Image.asset("assets/washhand.jpg")),
                                  Container(
                                      height: 120,
                                      width: MediaQuery.of(context).size.width /
                                          3.3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                      margin: EdgeInsets.only(
                                          top: 10,
                                          bottom: 20,
                                          right: 5,
                                          left: 5),
                                      child:
                                          Image.asset("assets/wearmask.jpg")),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.onMenuTap();
              });
            },
            child: Container(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0XFFAD9FE4).withOpacity(0.5),
                    Colors.white.withOpacity(0.5)
                  ]),
                  //color: Color(0xFF473F97),
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(30))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.onMenuTap();
                      });
                    },
                    icon: Icon(Icons.menu),
                    color: Colors.deepOrangeAccent,
                  ),
                  Text(
                    translated(context, 'homepage_title'),
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: DropdownButton(
                      dropdownColor: Colors.deepOrangeAccent,
                      focusColor: Colors.deepPurpleAccent,
                      underline: SizedBox(),
                      icon: Icon(
                        FontAwesomeIcons.globeAfrica,
                      ),
                      items: Language.languagelist()
                          .map<DropdownMenuItem<Language>>(
                              (lang) => DropdownMenuItem(
                                    value: lang,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[Text(lang.name)],
                                    ),
                                  ))
                          .toList(),
                      onChanged: (Language language) {
                        _changeLanguage(language);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      );
    })
        //
        );
  }

  SharedPreferences preferences;
  String casetoday = "";
  String recovertoday = "";
  String totalrecover = "";
  String deathtoday = "";
  String totalcase = "";
  String totaldeath = "";
  String totaltest = "";

  Future<void> updateCoviddatalayout() async {
    preferences = await SharedPreferences.getInstance();
    casetoday = preferences.getString("casetoday") ?? "0";
    recovertoday = preferences.getString("recovertoday") ?? "0";
    deathtoday = preferences.getString("deathtoday") ?? "0";
    totalcase = preferences.getString("totalcase") ?? "0";
    totalrecover = preferences.getString("totalrecover") ?? "0";
    totaldeath = preferences.getString("totaldeath") ?? "0";
    totaltest = preferences.getString("totaltest") ?? "0";
  }

  void savecoviddata() {
    casetoday =
        ethiopiandata == null ? "0" : ethiopiandata['todayCases'].toString();
    recovertoday = ethiopiandata == null
        ? "0"
        : ethiopiandata['todayRecovered'].toString();
    deathtoday =
        ethiopiandata == null ? "0" : ethiopiandata['todayDeaths'].toString();
    totalcase = ethiopiandata == null ? "0" : ethiopiandata['cases'].toString();
    totalrecover =
        ethiopiandata == null ? "0" : ethiopiandata['recovered'].toString();
    totaldeath =
        ethiopiandata == null ? "0" : ethiopiandata['deaths'].toString();
    totaltest = ethiopiandata == null ? "0" : ethiopiandata['tests'].toString();

    preferences.setString("casetoday", casetoday);
    preferences.setString("recovertoday", recovertoday);
    preferences.setString("deathtoday", deathtoday);
    preferences.setString("totalcase", totalcase);
    preferences.setString("totalrecover", totalrecover);
    preferences.setString("totaldeath", totaldeath);
    preferences.setString("totaltest", totaltest);
  }

  onNotificationClick(String payload) {
    debugPrint("payload : $payload");
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: new Text(translated(context, 'notification')),
        content: new Text('$payload'),
      ),
    );
  }

  Future<String> hundlerefresh() async {
    fetchethiopianData();
    await new Future.delayed(Duration(seconds: 3));
    savecoviddata();
    print('refreshing....');
    return null;
  }

  void workmanagerinitializer() async {
    await Workmanager.initialize(callbackDispatcher, isInDebugMode: true);
    await Workmanager.registerPeriodicTask(
      "uniqueName",
      peroidicnotification,
      existingWorkPolicy: ExistingWorkPolicy.replace,
      frequency: Duration(minutes: _periodicminute ?? 15),
      initialDelay: Duration(seconds: 2),
    );
  }
}

// ********************************************************************************************

// ********************************************************************************************
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 30);

    var firstcontrolpoint = new Offset(size.width / 4, size.height);
    var firstendpoint = new Offset(size.width / 2.25, size.height - 25.0);
    path.quadraticBezierTo(firstcontrolpoint.dx, firstcontrolpoint.dy,
        firstendpoint.dx, firstendpoint.dy);

    var secondControlPoint =
        new Offset(size.width - (size.width / 3.25), size.height - 50);
    var secondEndPoint = new Offset(size.width, size.height - 25);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class MyClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);

    var firstcontrolpoint = new Offset(size.width / 2, size.height - 50);
    var firstendpoint = new Offset(size.width, size.height);
    path.quadraticBezierTo(firstcontrolpoint.dx, firstcontrolpoint.dy,
        firstendpoint.dx, firstendpoint.dy);

    var secondControlPoint = new Offset(size.width / 20, size.height - 50);
    var secondEndPoint = new Offset(size.width, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0.0);
    // path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class MyClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 10, size.height - 30, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 3 * size.width, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    //path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
