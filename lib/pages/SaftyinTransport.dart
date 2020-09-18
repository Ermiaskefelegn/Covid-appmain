import 'package:flutter/material.dart';
import 'package:myapp1/bloc/navigation_bloc.dart';
import 'package:myapp1/layout_pages/Expanded_tile_forprevention.dart';
import 'package:myapp1/localizations/localization_constant.dart';

class SaftyinTransport extends StatelessWidget with NavigationStates {
  final Function onMenuTap;

  const SaftyinTransport({Key key, this.onMenuTap}) : super(key: key);

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
        expandedHeight: MediaQuery.of(context).size.height / 2.7,
        title: Text(
          translated(context, 'transport'),
          style: TextStyle(
              color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        pinned: true,
        flexibleSpace: new FlexibleSpaceBar(
          background: Image.asset("assets/wearmask.jpg"),
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
                  mytitle: translated(context, 'tp1'),
                  detailtext: translated(context, 'tp1_detail'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/tp1.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'tp2'),
                  detailtext: translated(context, 'tp2_detail'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/tp2.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'tp3'),
                  detailtext: translated(context, 'tp3_detail'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/tp3.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'tp4'),
                  detailtext: translated(context, 'tp4_detail'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/tp4.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'tp5'),
                  detailtext: translated(context, 'tp5_detail'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/tp5.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'tp6'),
                  detailtext: translated(context, 'tp6_detail'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/tp6.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'tp7'),
                  detailtext: translated(context, 'tp7_detail'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/tp7.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'tp8'),
                  detailtext: translated(context, 'tp8_detail'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/tp8.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'tp9'),
                  detailtext: translated(context, 'tp9_detail'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/tp9.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'tp10'),
                  detailtext: translated(context, 'tp10_detail'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/tp10.jpg",
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
