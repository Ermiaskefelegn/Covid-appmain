import 'package:flutter/material.dart';
import 'package:myapp1/bloc/navigation_bloc.dart';

class Dashboard extends StatelessWidget with NavigationStates {
  final bool isCollapsed;
  final bool isDrawerOpen;
  final Duration duration;
  final Animation<double> scaleAnimation;
  final double screenwidth, screenheight;
  final Function onMenuTap;
  final Function onMenuTapclosed;
  final Function onMenuitemselected;
  final Function showNotification;
  final Function notification;
  final Function cancelNotification;
  final Widget child;
  const Dashboard(
      {Key key,
      this.isCollapsed,
      this.isDrawerOpen,
      this.duration,
      this.scaleAnimation,
      this.screenwidth,
      this.screenheight,
      this.onMenuTap,
      this.child,
      this.onMenuTapclosed,
      this.showNotification,
      this.notification,
      this.cancelNotification,
      this.onMenuitemselected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        duration: duration,
        top: 0,
        left: isCollapsed ? 0 : 0.45 * screenwidth,
        bottom: 0,
        right: isCollapsed ? 0 : -0.6 * screenwidth,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Material(
            animationDuration: duration,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
            elevation: 8,
            child: child,
          ),
        ));
  }
}
