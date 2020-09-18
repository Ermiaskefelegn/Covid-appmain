import 'package:flutter/material.dart';

class Expandedtile extends StatelessWidget {
  final String mytitle;
  final Color mybgcolor;
  final Widget leadicon;
  final String detailtext;
  Expandedtile({this.mytitle, this.mybgcolor, this.leadicon, this.detailtext});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        backgroundColor: mybgcolor,
        leading: leadicon,
        title: Text(mytitle),
        children: <Widget>[
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              elevation: 4.0,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    detailtext,
                    textAlign: TextAlign.justify,
                  ))),
        ],
      ),
    );
  }
}
