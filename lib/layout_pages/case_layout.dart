import 'package:flutter/material.dart';

class Caselayout extends StatelessWidget {
  final Color bgcolor;
  final String dailyamount;
  final String type;
  final String totaldetail;
  final String totalamount;
  final Map ethethiopiandata;

  const Caselayout(
      {Key key,
      this.bgcolor,
      this.dailyamount,
      this.type,
      this.totaldetail,
      this.totalamount,
      this.ethethiopiandata})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4.3,
      width: MediaQuery.of(context).size.width / 3.35,
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: bgcolor,
      ),
      margin: EdgeInsets.only(top: 10, bottom: 5, right: 5, left: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                dailyamount,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                type,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                totaldetail,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                totalamount,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
