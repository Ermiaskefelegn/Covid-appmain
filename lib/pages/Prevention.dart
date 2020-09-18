import 'package:flutter/material.dart';
import 'package:myapp1/bloc/navigation_bloc.dart';
import 'package:myapp1/layout_pages/Expanded_tile_forprevention.dart';
import 'package:myapp1/localizations/localization_constant.dart';

class Prevention extends StatelessWidget with NavigationStates {
  final Function onMenuTap;

  const Prevention({Key key, this.onMenuTap}) : super(key: key);

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
        expandedHeight: MediaQuery.of(context).size.height / 2.05,
        title: Text(
          translated(context, 'prevention'),
          style: TextStyle(
              color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold),
          textAlign: TextAlign.end,
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
                  mytitle: translated(context, 'prevention1'),
                  detailtext: translated(context, 'prevention1_detail'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/washhand.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'prevention2'),
                  detailtext: translated(context, 'prevention2_detail'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/washhand.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'prevention3'),
                  detailtext: translated(context, 'prevention3_detail'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/diatance.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'prevention4'),
                  detailtext: translated(context, 'prevention4_detail'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/wearmask.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'prevention5'),
                  detailtext: translated(context, 'prevention5_detail'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/covering.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'prevention6'),
                  detailtext: translated(context, 'prevention6_detail'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/keepclean.jpg",
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
