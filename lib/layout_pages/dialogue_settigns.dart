import 'package:flutter/material.dart';
import 'package:myapp1/pages/settings.dart';

class Customedialog extends StatefulWidget {
  @override
  _CustomedialogState createState() => _CustomedialogState();
}

class _CustomedialogState extends State<Customedialog> {
  bool monday, tuesday, wednsday, thursday, friday, saturday, sunday;
  int start = 0, end = 0, min1 = 0, min2 = 0;
  @override
  void initState() {
    super.initState();
    getmonday().then(updatemonday);
    gettuesday().then(updatetuesday);
    getstarthour().then(updatestart);
    getwednsday().then(updatewednsday);
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

  void updatestart(int starthour) {
    if (mounted) {
      setState(() {
        this.start = starthour ?? 12;
        print(starthour);
      });
    }
  }

  void updateend(int end) {
    if (mounted) {
      setState(() {
        this.end = end ?? 0;
      });
    }
  }

  void updatemin1(int min1) {
    if (mounted) {
      setState(() {
        this.min1 = min1 ?? 15;
      });
    }
  }

  void updatemin2(int min2) {
    if (mounted) {
      setState(() {
        this.min2 = min2 ?? 60;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
          height: 450,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 6, top: 10),
                  child: Text('Personal Detail',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 4, top: 10),
                      child: Text('the value of first day is $monday',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 4, top: 10),
                      child: Text('the value of day time is $start',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
