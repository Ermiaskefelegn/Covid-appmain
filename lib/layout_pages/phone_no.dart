import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp1/localizations/localization_constant.dart';
import 'package:url_launcher/url_launcher.dart';

class Phonelayout extends StatefulWidget {
  const Phonelayout({
    Key key,
    this.regionname,
    this.shortcallcenter,
    this.longcallcenter,
    this.longdial,
    this.shordial,
  }) : super(key: key);

  final String regionname;
  final String shortcallcenter;
  final String longcallcenter;
  final String longdial;
  final String shordial;

  @override
  _PhonelayoutState createState() => _PhonelayoutState();
}

class _PhonelayoutState extends State<Phonelayout> {
  Future<void> logdial(longdial) async {
    if (await canLaunch(longdial)) {
      await launch(longdial);
    } else {
      throw 'Could not launch $longdial';
    }
  }

  Future<void> shortdial(shordial) async {
    await launch(shordial);
    if (await canLaunch(shordial)) {
    } else {
      throw 'Could not launch $shordial';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.05,
      width: MediaQuery.of(context).size.width / 1.05,
      //margin: EdgeInsets.only(top: 5, bottom: 5),
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white.withOpacity(0.2),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20, top: 5, bottom: 5),
              child: Text(
                widget.regionname,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width / 3.3,
                  width: MediaQuery.of(context).size.width / 2.8,
                  // padding: EdgeInsets.only(
                  //   top: 5,
                  //   bottom: 5,
                  // ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.greenAccent.withOpacity(0.5),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.shortcallcenter,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      InkWell(
                          onTap: () {
                            setState(() {
                              shortdial('tel:' + widget.shordial);
                            });
                          },
                          child: Icon(FontAwesomeIcons.phone, size: 45)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        translated(context, "call"),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.width / 3.3,
                  width: MediaQuery.of(context).size.width / 2.8,
                  // padding: EdgeInsets.only(
                  //   top: 5,
                  //   bottom: 5,
                  // ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.greenAccent.withOpacity(0.5),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.longcallcenter,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      InkWell(
                          onTap: () {
                            setState(() {
                              logdial('tel:' + widget.longdial);
                            });
                          },
                          child: Icon(FontAwesomeIcons.phone, size: 45)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        translated(context, "call"),
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
