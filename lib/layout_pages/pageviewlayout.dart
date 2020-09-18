import 'package:flutter/material.dart';

class Pageviewlayout extends StatelessWidget {
  final String title;
  final String pageviewimage;

  const Pageviewlayout({Key key, this.title, this.pageviewimage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.blueAccent.withOpacity(0.2),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 4.2,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white),
                  margin: EdgeInsets.all(5),
                  child: Image.asset(pageviewimage),
                ),
                Center(
                    child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent),
                ))
              ],
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.chevron_right,
                    size: 35, color: Colors.deepOrangeAccent))
          ],
        ));
  }
}
