import 'package:flutter/material.dart';
import 'package:myapp1/bloc/navigation_bloc.dart';
import 'package:myapp1/layout_pages/Expanded_tile_forprevention.dart';
import 'package:myapp1/localizations/localization_constant.dart';

class FaceMask extends StatelessWidget with NavigationStates {
  final Function onMenuTap;

  const FaceMask({Key key, this.onMenuTap}) : super(key: key);

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
          translated(context, 'facemask'),
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
                  mytitle: translated(context, 'mask1'),
                  detailtext: translated(context, 'mask1_detail'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/mask.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'masktitle'),
                  detailtext: translated(context, 'mask2'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/mask1.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'masktitle'),
                  detailtext: translated(context, 'mask3'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/mask4.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'masktitle'),
                  detailtext: translated(context, 'mask4'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/mask2.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'masktitle'),
                  detailtext: translated(context, 'mask5'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/mask3.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'masktitle'),
                  detailtext: translated(context, 'mask6'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/dos-donts.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'masktitle'),
                  detailtext: translated(context, 'mask7'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/mask5.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'mask8'),
                  detailtext: translated(context, 'mask8_rule1'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/mask2.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'mask8'),
                  detailtext: translated(context, 'mask8_rule2'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/mask2.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'mask8'),
                  detailtext: translated(context, 'mask8_rule3'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/mask7.jpg",
                ),
                Expandedtileforprevention(
                  mytitle: translated(context, 'mask8'),
                  detailtext: translated(context, 'mask8_rule4'),
                  leadicon: Icon(Icons.info_outline),
                  myimage: "assets/mask5.jpg",
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
