import 'package:flutter/material.dart';
import 'package:myapp1/bloc/navigation_bloc.dart';
import 'package:myapp1/layout_pages/Expanded_tile_forprevention.dart';
import 'package:myapp1/localizations/localization_constant.dart';

class Symptomes extends StatelessWidget with NavigationStates {
  final Function onMenuTap;

  const Symptomes({Key key, this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left,
              color: Colors.deepOrangeAccent,
            )),
        backgroundColor: Colors.white,
        expandedHeight: MediaQuery.of(context).size.height / 3.05,
        title: Text(
          translated(context, 'symptoms'),
          style: TextStyle(
              color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold),
          textAlign: TextAlign.end,
        ),
        pinned: true,
        flexibleSpace: new FlexibleSpaceBar(
          background: Image.asset("assets/fever.jpg"),
        ),
      ),
      new SliverList(
          delegate: new SliverChildBuilderDelegate(
        (context, index) => Card(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                Expandedtileforprevention(
                  mytitle: translated(context, 'symptoms'),
                  detailtext: translated(context, 'symptome_detail'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/fever.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'symptome1'),
                  detailtext: translated(context, 'mask8_rule3'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/fever.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'symptome2'),
                  detailtext: translated(context, 'mask8_rule3'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/dry cough.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'symptome3'),
                  detailtext: translated(context, 'mask8_rule3'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/breathlessness.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'symptome4'),
                  detailtext: translated(context, 'mask8_rule3'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/fatigue.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'symptome5'),
                  detailtext: translated(context, 'mask8_rule3'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/musclepain.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'symptome6'),
                  detailtext: translated(context, 'mask8_rule3'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/headace.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'symptome8'),
                  detailtext: translated(context, 'mask8_rule3'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/sneez.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'symptome9'),
                  detailtext: translated(context, 'mask8_rule3'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/soarthrote.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'symptome10'),
                  detailtext: translated(context, 'mask8_rule3'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/vomit.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'symptome11'),
                  detailtext: translated(context, 'mask8_rule3'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/diahrra.jpg",
                ),
              ],
            ),
          ),
        ),
        childCount: 1,
      ))
    ]));
  }
}
