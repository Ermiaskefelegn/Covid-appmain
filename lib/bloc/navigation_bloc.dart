import 'package:myapp1/pages/aboutCovid.dart';
import 'package:myapp1/pages/aboutus.dart';
import 'package:myapp1/pages/card_page.dart';
import 'package:myapp1/pages/help.dart';
import 'package:myapp1/pages/settings.dart';
import 'package:bloc/bloc.dart';

enum NavigationEvents {
  DashboardClickEvent,
  CovidClickEvent,
  SettingsClickEvent,
  HelpClickEvent,
  AboutClickEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  final Function onMenuTap;

  NavigationBloc({this.onMenuTap});

  @override
  NavigationStates get initialState => MyCardsPage(
        onMenuTap: onMenuTap,
      );

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.DashboardClickEvent:
        yield MyCardsPage(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.SettingsClickEvent:
        yield Settings(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.CovidClickEvent:
        yield AboutCovid(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.HelpClickEvent:
        yield Help(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.AboutClickEvent:
        yield AboutUs(
          onMenuTap: onMenuTap,
        );
        break;
    }
  }
}
