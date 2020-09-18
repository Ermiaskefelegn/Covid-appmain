import 'package:flutter/material.dart';
import 'package:myapp1/bloc/navigation_bloc.dart';
import 'package:myapp1/layout_pages/Expanded_tile.dart';
import 'package:myapp1/layout_pages/datasource.dart';
import 'package:myapp1/localizations/localization_constant.dart';

class AboutCovid extends StatelessWidget with NavigationStates {
  final Function onMenuTap;

  const AboutCovid({Key key, this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), bottomLeft: Radius.circular(30))),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 60),
              child: ListView.builder(
                  itemCount: Datasource.questionandansewers.length,
                  itemBuilder: (context, index) {
                    return Expandedtile(
                      mytitle: (Datasource.questionandansewers[index]
                          ['question']),
                      detailtext: (Datasource.questionandansewers[index]
                          ['answer']),
                      leadicon: Icon(Icons.question_answer),
                    );
                  }),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 35, left: 15, right: 15, bottom: 5),
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
                    onPressed: onMenuTap,
                    icon: Icon(Icons.menu),
                    color: Colors.deepOrangeAccent,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 25,
                    ),
                    child: Text(
                      translated(context, 'faq'),
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
          ],
        ));
  }
}
