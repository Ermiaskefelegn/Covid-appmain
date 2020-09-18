import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp1/bloc/navigation_bloc.dart';
import 'package:myapp1/layout_pages/dashboard.dart';
import 'package:myapp1/layout_pages/menu.dart';
import 'package:myapp1/pages/aboutCovid.dart';
import 'package:myapp1/pages/aboutus.dart';
import 'package:myapp1/pages/card_page.dart';
import 'package:myapp1/pages/help.dart';
import 'package:myapp1/pages/settings.dart';

final Color bgcolor = Colors.white;
final Color bgcolor2 = Colors.grey[900];

class Menudashboardpage extends StatefulWidget {
  @override
  _MenudashboardpageState createState() => _MenudashboardpageState();
}

class _MenudashboardpageState extends State<Menudashboardpage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  bool valueV = false;
  bool isDrawerOpen = false;
  double screenwidth, screenheight;
  final Duration duration = const Duration(milliseconds: 350);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<Offset> _slideAnimation;
  Animation<double> _menuScaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.75).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onMenuitemselected() {
    setState(() {
      _controller.reverse();
    });
    isCollapsed = !isCollapsed;
  }

  void onchanged(bool value) {
    setState(() {
      valueV = value;
    });
  }

  void onMenuTap() {
    setState(() {
      if (isCollapsed) {
        _controller.forward();
        isDrawerOpen = false;
      } else
        _controller.reverse();
      isCollapsed = !isCollapsed;
    });
  }

  void onMenuTapclosed() {
    setState(() {
      if (isCollapsed) {
        _controller.forward();
      } else
        _controller.reverse();
      isCollapsed = !isCollapsed;
      isDrawerOpen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenwidth = size.width;
    screenheight = size.height;
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) {
          return NavigationBloc(
            onMenuTap: onMenuTap,
          );
        },
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
                builder: (context, NavigationStates navigationStates) {
              return Menu(
                  slideAnimation: _slideAnimation,
                  menuAnimation: _menuScaleAnimation,
                  selectedIndex: findselectedIndex(navigationStates),
                  onMenuitemselected: onMenuitemselected,
                  valueV: valueV,
                  onchanged: onchanged);
            }),
            Dashboard(
                duration: duration,
                onMenuTap: onMenuTap,
                onMenuTapclosed: onMenuTapclosed,
                scaleAnimation: _scaleAnimation,
                isCollapsed: isCollapsed,
                screenwidth: screenwidth,
                screenheight: screenheight,
                child: BlocBuilder<NavigationBloc, NavigationStates>(
                    builder: (context, NavigationStates navigationState) {
                  return navigationState as Widget;
                })),
          ],
        ),
      ),
    );
  }
}

//************************************clip path class****************************************
int findselectedIndex(NavigationStates navigationStates) {
  if (navigationStates is MyCardsPage) {
    return 0;
  } else if (navigationStates is AboutCovid) {
    return 1;
  } else if (navigationStates is Settings) {
    return 2;
  } else if (navigationStates is Help) {
    return 3;
  } else if (navigationStates is AboutUs) {
    return 4;
  } else if (navigationStates is Dashboard) {
    return 4;
  } else {
    return 0;
  }
}
