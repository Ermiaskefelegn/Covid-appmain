import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp1/bloc/navigation_bloc.dart';
import 'package:myapp1/localizations/localization_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:myapp1/layout_pages/appbar.dart';

class Settings extends StatefulWidget with NavigationStates {
  final Function onMenuTap;

  const Settings({Key key, this.onMenuTap}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int endhour, endmin, startmin, min1, min2;
  DateTime _dateTime = DateTime.now();
  DateTime _dateTime2 = DateTime.now();

  var _controller = new TextEditingController();
  var _controller2 = new TextEditingController();
  bool showsetting = false;
  @override
  void initState() {
    super.initState();
    getsettingsvalue();
  }

  bool monday = false;
  void mondayy(bool value) {
    setState(() {
      monday = value;
    });
  }

  bool tuesday = false;
  void tuesdayy(bool value) {
    setState(() {
      tuesday = value;
    });
  }

  bool wednsday = false;
  void wednsdayy(bool value) {
    setState(() {
      wednsday = value;
    });
  }

  bool thursday = false;
  void thursdayy(bool value) {
    setState(() {
      thursday = value;
    });
  }

  bool friday = false;
  void fridayy(bool value) {
    setState(() {
      friday = value;
    });
  }

  bool saturday = false;
  void saturdayy(bool value) {
    setState(() {
      saturday = value;
    });
  }

  bool sunday = false;
  void sundayy(bool value) {
    setState(() {
      sunday = value;
    });
  }

  int selsected = 0;

  void onPressed() {}
  void onchanged(int value) {
    setState(() {
      selsected = value;
      if (value == 0) {
        showsetting = true;
        setsettingsvalue();
      } else {
        showsetting = false;
        setsettingsvalue();
      }
    });
  }

  List<Widget> makeRadios() {
    List<Widget> list = new List<Widget>();
    List names = new List(2);
    names[0] = translated(context, 'answer');
    names[1] = translated(context, 'answer2');
    List icons = new List(2);
    icons[0] = Icon(Icons.work);
    icons[1] = Icon(Icons.home);
    for (int i = 0; i < 2; i++) {
      list.add(new RadioListTile(
        value: i,
        title: Text(names[i]),
        groupValue: selsected,
        onChanged: (int value) {
          onchanged(value);
        },
        activeColor: Colors.deepOrangeAccent,
        secondary: icons[i],
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 70),
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.questionCircle),
                          SizedBox(
                            width: 10,
                          ),
                          Text(translated(context, 'question1'),
                              style: TextStyle(
                                fontSize: 17,
                              )),
                        ],
                      ),
                    ),
                    Center(
                        child: Column(
                      children: makeRadios(),
                    )),
                    Visibility(
                        visible: showsetting,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text(translated(context, 'question2'),
                                  style: TextStyle(
                                    fontSize: 17,
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.all(0),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.calendar_today),
                                        SizedBox(width: 10),
                                        Text(translated(context, 'monday'),
                                            style: TextStyle(
                                              fontSize: 17,
                                            )),
                                        Checkbox(
                                            value: monday,
                                            onChanged: (bool value) {
                                              mondayy(value);
                                            }),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.calendar_today),
                                        SizedBox(width: 10),
                                        Text(translated(context, 'tuesday'),
                                            style: TextStyle(
                                              fontSize: 17,
                                            )),
                                        Checkbox(
                                            value: tuesday,
                                            onChanged: (bool value) {
                                              tuesdayy(value);
                                            }),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.calendar_today),
                                        SizedBox(width: 10),
                                        Text(translated(context, 'wednsday'),
                                            style: TextStyle(
                                              fontSize: 17,
                                            )),
                                        Checkbox(
                                            value: wednsday,
                                            onChanged: (bool value) {
                                              wednsdayy(value);
                                            }),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.calendar_today),
                                        SizedBox(width: 10),
                                        Text(translated(context, 'thursday'),
                                            style: TextStyle(
                                              fontSize: 17,
                                            )),
                                        Checkbox(
                                            value: thursday,
                                            onChanged: (bool value) {
                                              thursdayy(value);
                                            }),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.calendar_today),
                                        SizedBox(width: 10),
                                        Text(translated(context, 'friday'),
                                            style: TextStyle(
                                              fontSize: 17,
                                            )),
                                        Checkbox(
                                            value: friday,
                                            onChanged: (bool value) {
                                              fridayy(value);
                                            }),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.calendar_today),
                                        SizedBox(width: 10),
                                        Text(translated(context, 'saturday'),
                                            style: TextStyle(
                                              fontSize: 17,
                                            )),
                                        Checkbox(
                                            value: saturday,
                                            onChanged: (bool value) {
                                              saturdayy(value);
                                            }),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.calendar_today),
                                        SizedBox(width: 10),
                                        Text(translated(context, 'sunday'),
                                            style: TextStyle(
                                              fontSize: 17,
                                            )),
                                        Checkbox(
                                            value: sunday,
                                            onChanged: (bool value) {
                                              sundayy(value);
                                            }),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text(translated(context, 'question3'),
                                  style: TextStyle(
                                    fontSize: 17,
                                  )),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                    child: TimePickerSpinner(
                                      alignment: Alignment.center,
                                      itemHeight: 40,
                                      itemWidth: 60,
                                      spacing: 2,
                                      isForce2Digits: true,
                                      normalTextStyle: TextStyle(fontSize: 18),
                                      highlightedTextStyle: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepOrangeAccent),
                                      is24HourMode: false,
                                      onTimeChange: (time) {
                                        setState(() {
                                          _dateTime = time;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    _dateTime.hour.toString().padLeft(2, '0') +
                                        ':' +
                                        _dateTime.minute
                                            .toString()
                                            .padLeft(2, '0'),
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text(translated(context, 'question4'),
                                  style: TextStyle(
                                    fontSize: 17,
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 25, bottom: 10),
                              width: MediaQuery.of(context).size.width / 4,
                              child: Column(
                                children: <Widget>[
                                  new TextField(
                                    controller: _controller2,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Minutes')
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text(translated(context, 'question4'),
                                  style: TextStyle(
                                    fontSize: 17,
                                  )),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                    child: TimePickerSpinner(
                                      alignment: Alignment.center,
                                      itemHeight: 40,
                                      itemWidth: 60,
                                      spacing: 2,
                                      isForce2Digits: true,
                                      normalTextStyle: TextStyle(fontSize: 18),
                                      highlightedTextStyle: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepOrangeAccent),
                                      is24HourMode: false,
                                      onTimeChange: (time) {
                                        setState(() {
                                          _dateTime2 = time;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    _dateTime2.hour.toString().padLeft(2, '0') +
                                        ':' +
                                        _dateTime2.minute
                                            .toString()
                                            .padLeft(2, '0'),
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.notification_important),
                          SizedBox(
                            width: 10,
                          ),
                          Text(translated(context, "notifyme"),
                              style: TextStyle(
                                fontSize: 17,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, bottom: 10),
                      width: MediaQuery.of(context).size.width / 4,
                      child: Column(
                        children: <Widget>[
                          new TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly
                            ],
                            controller: _controller,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Minutes')
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20, top: 55),
                      alignment: Alignment.bottomRight,
                      child: RaisedButton(
                          child: Text('Save'),
                          onPressed: () {
                            savestarthour();
                            savestartmin();
                            saveendhour();
                            saveendmin();
                            saveminute2();
                            getsettingsvalue();
                            savevalues();
                          }),
                    ),
                  ],
                ),
              )),
          GestureDetector(
            onTap: () {
              widget.onMenuTap();
            },
            child: Container(
              padding: const EdgeInsets.only(
                  top: 25, left: 15, right: 15, bottom: 5),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0XFFAD9FE4).withOpacity(1),
                    Colors.white.withOpacity(1)
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
                  Padding(
                    padding: EdgeInsets.only(
                      right: 25,
                    ),
                    child: Text(
                      translated(context, 'settings'),
                      style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void saveminute() {
    int min = int.parse(_controller.text);
    setState(() {
      saveminutespreferences(min).then((bool success) {
        return min;
      });
    });
  }

  void saveminute2() {
    int min2 = int.parse(_controller2.text) ?? 60;
    setState(() {
      saveminutespreferences2(min2).then((bool success) {
        return min2;
      });
    });
  }

  void savestarthour() {
    int mstarthour = int.parse(_dateTime.hour.toString());
    setState(() {
      setstarthour(mstarthour).then((bool success) {
        return mstarthour;
      });
    });
  }

  void savestartmin() {
    int mstartmin = int.parse(_dateTime.minute.toString());
    setState(() {
      setstartmin(mstartmin).then((bool success) {
        return mstartmin;
      });
    });
  }

  void saveendhour() {
    int mendhour = int.parse(_dateTime2.hour.toString());
    setState(() {
      setendhour(mendhour).then((bool success) {
        return mendhour;
      });
    });
  }

  void saveendmin() {
    int mendmin = int.parse(_dateTime2.minute.toString());
    setState(() {
      setendmin(mendmin).then((bool success) {
        return mendmin;
      });
    });
  }

  void savevalues() {
    setState(() {
      setmonday(monday).then((bool success) {
        return monday;
      });
      settuesday(tuesday).then((bool success) {
        return tuesday;
      });
      setwednsday(wednsday).then((bool success) {
        return wednsday;
      });
      setthursday(thursday).then((bool success) {
        return thursday;
      });
      setfriday(friday).then((bool success) {
        return friday;
      });
      setsatuday(saturday).then((bool success) {
        return saturday;
      });
      setsunuday(sunday).then((bool success) {
        return sunday;
      });
      setmin1(min1).then((bool success) {
        return min1;
      });
      setmin2(min2).then((bool success) {
        return min2;
      });
    });
  }

  void setsettingsvalue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //showsetting = null ?? false;
    prefs.setBool('showsetting', showsetting);
  }

  void getsettingsvalue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    showsetting = (prefs.getBool('showsetting') ?? false);
    print('the saved value of showsetting is $showsetting');
  }

// *******************************************************************************************************

}

Future<bool> saveminutespreferences(int miniute) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setInt("minute", miniute);
  // ignore: deprecated_member_use
  return preferences.commit();
}

Future<int> getminuteprefernce() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  int miniute = preferences.getInt("minute");
  return miniute;
}

Future<bool> saveminutespreferences2(int miniute2) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setInt("miniute2", miniute2);
  // ignore: deprecated_member_use
  return preferences.commit();
}

Future<int> getminuteprefernce2() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  int miniute2 = preferences.getInt("miniute2");
  return miniute2;
}

Future<bool> getmonday() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool mon = (prefs.getBool('mon') ?? false);
  print("setnotification status $mon");
  return mon;
}

Future<bool> setmonday(bool mon) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('mon', mon);

  // ignore: deprecated_member_use
  return prefs.commit();
}

Future<bool> gettuesday() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool tue = (prefs.getBool('tue') ?? false);
  print("setnotification status $tue");
  return tue;
}

Future<bool> settuesday(bool tue) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('tue', tue);
  // ignore: deprecated_member_use
  return prefs.commit();
}

Future<bool> getwednsday() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool wed = (prefs.getBool('wed') ?? false);
  print("setnotification status $wed");
  return wed;
}

Future<bool> setwednsday(bool wed) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('wed', wed);
  // ignore: deprecated_member_use
  return prefs.commit();
}

Future<bool> getthursday() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool thu = (prefs.getBool('thu') ?? false);
  print("setnotification status $thu");
  return thu;
}

Future<bool> setthursday(bool thu) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('thu', thu);
  // ignore: deprecated_member_use
  return prefs.commit();
}

Future<bool> getfriday() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool fri = (prefs.getBool('fri') ?? false);
  print("setnotification status $fri");
  return fri;
}

Future<bool> setfriday(bool fri) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('fri', fri);
  // ignore: deprecated_member_use
  return prefs.commit();
}

Future<bool> getsatuday() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool sat = (prefs.getBool('sat') ?? false);
  print("setnotification status $sat");
  return sat;
}

Future<bool> setsatuday(bool sat) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('tue', sat);
  // ignore: deprecated_member_use
  return prefs.commit();
}

Future<bool> getsunuday() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool sun = (prefs.getBool('sun') ?? false);
  print("setnotification status $sun");
  return sun;
}

Future<bool> setsunuday(bool sun) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('sun', sun);
  // ignore: deprecated_member_use
  return prefs.commit();
}

Future<int> getstarthour() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int starthour = (prefs.getInt('starthour'));

  return starthour;
}

Future<bool> setstarthour(int starthour) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('starthour', starthour);
  // ignore: deprecated_member_use
  return prefs.commit();
}

Future<int> getstartmin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int startmin = (prefs.getInt('startmin') ?? 30);

  return startmin;
}

Future<bool> setstartmin(int startmin) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('startmin', startmin);
  // ignore: deprecated_member_use
  return prefs.commit();
}

Future<int> getendhour() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int endhour = (prefs.getInt('endhour') ?? 11);

  return endhour;
}

Future<bool> setendhour(int endhour) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('endhour', endhour);
  // ignore: deprecated_member_use
  return prefs.commit();
}

Future<int> getendmin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int endmin = (prefs.getInt('endmin') ?? 0);

  return endmin;
}

Future<bool> setendmin(int endmin) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('endmin', endmin);
  // ignore: deprecated_member_use
  return prefs.commit();
}

Future<int> getmin1() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int min1 = (prefs.getInt('min1') ?? 0);

  return min1;
}

Future<bool> setmin1(int min1) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('min1', min1);
  // ignore: deprecated_member_use
  return prefs.commit();
}

Future<int> getmin2() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int min2 = (prefs.getInt('min1') ?? false);
  print("setnotification status $min2");
  return min2;
}

Future<bool> setmin2(int min2) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('min2', min2);
  // ignore: deprecated_member_use
  return prefs.commit();
}
