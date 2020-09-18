import 'package:flutter/material.dart';
import 'package:myapp1/bloc/navigation_bloc.dart';
import 'package:myapp1/layout_pages/Expanded_tile_forprevention.dart';
import 'package:myapp1/localizations/localization_constant.dart';

class Patientcare extends StatelessWidget with NavigationStates {
  final Function onMenuTap;

  const Patientcare({Key key, this.onMenuTap}) : super(key: key);

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
          translated(context, 'sick'),
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
                  mytitle: translated(context, 'sick1'),
                  detailtext: translated(context, 'sick1_detail'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/sick2.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'sick2'),
                  detailtext: translated(context, 'sick2_detail'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/sick1.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'sick3'),
                  detailtext: translated(context, 'sick3_detail'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/sick3.jpg",
                )
              ],
            ),
          ),
        ),
        childCount: 1,
      ))
    ]));
  }
}
