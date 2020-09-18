import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp1/layout_pages/menudashbord.dart';
import 'package:myapp1/layout_pages/onboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Springboardpage extends StatefulWidget {
  @override
  _SpringboardpageState createState() => _SpringboardpageState();
}

class _SpringboardpageState extends State<Springboardpage> {
  Timer timer;
  @override
  void initState() {
    super.initState();
    showprogress();
  }

  showprogress() async {
    await Future.delayed(Duration(seconds: 3));
    onboardlauncher();
  }

  onboardlauncher() async {
    bool visitingflag = await getvisitingFlag();
    setvisitingFlag();
    if (visitingflag == true) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Menudashboardpage()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Onboardscreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0XFFAD9FE4).withOpacity(0.6),
            Colors.white.withOpacity(0.6)
          ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.deepOrangeAccent.withOpacity(0.6)),
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Loading...")
          ],
        ),
      ),
    );
  }
}

setvisitingFlag() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool("alreadyvisited", true);
}

getvisitingFlag() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool alreadyvisited = preferences.getBool("alreadyvisited") ?? false;
  return alreadyvisited;
}
