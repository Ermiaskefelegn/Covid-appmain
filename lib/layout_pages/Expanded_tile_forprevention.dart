import 'package:flutter/material.dart';

class Expandedtileforprevention extends StatelessWidget {
  final String mytitle;
  final Color mybgcolor;
  final Widget leadicon;
  final String detailtext;
  final String myimage;
  Expandedtileforprevention(
      {this.mytitle,
      this.mybgcolor,
      this.leadicon,
      this.detailtext,
      this.myimage});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        backgroundColor: mybgcolor,
        leading: leadicon,
        title: Text(mytitle),
        children: <Widget>[
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 4.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width / 3.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    margin:
                        EdgeInsets.only(top: 10, bottom: 20, right: 5, left: 5),
                    child: Image.asset(myimage)),
                Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(detailtext, textAlign: TextAlign.justify))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
