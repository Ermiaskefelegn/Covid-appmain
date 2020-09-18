import 'package:flutter/material.dart';
import 'package:myapp1/bloc/navigation_bloc.dart';
import 'package:myapp1/localizations/localization_constant.dart';

class Help extends StatelessWidget with NavigationStates {
  final Function onMenuTap;

  const Help({Key key, this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), bottomLeft: Radius.circular(30))),
        child: Column(children: <Widget>[
          Container(
            padding:
                const EdgeInsets.only(top: 35, left: 15, right: 15, bottom: 5),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0XFFAD9FE4).withOpacity(0.5),
                  Colors.greenAccent.withOpacity(0.5)
                ]),
                //color: Color(0xFF473F97),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                IconButton(
                  onPressed: onMenuTap,
                  icon: Icon(Icons.menu),
                  color: Colors.deepOrangeAccent,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 25,
                  ),
                  child: Text(
                    translated(context, 'help'),
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
          SizedBox(height: 200),
          Center(
              child: Icon(
            Icons.sentiment_satisfied,
            size: 120.0,
            color: Colors.lightGreen,
          ))
        ]));
  }
}
