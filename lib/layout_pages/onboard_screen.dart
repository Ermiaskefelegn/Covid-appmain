import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:myapp1/layout_pages/menudashbord.dart';

class Onboardscreen extends StatefulWidget {
  @override
  _OnboardscreenState createState() => _OnboardscreenState();
}

class _OnboardscreenState extends State<Onboardscreen> {
  final pageDecoration = PageDecoration(
    titleTextStyle:
        PageDecoration().titleTextStyle.copyWith(color: Colors.black),
    bodyTextStyle: PageDecoration().bodyTextStyle.copyWith(color: Colors.black),
  );

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          // image:Image.asset("") ,
          title: "Page 1",
          body: "1",
          footer: Text(""),
          decoration: pageDecoration),
      PageViewModel(
          // image:Image.asset("") ,
          title: "Page 2",
          body: "2",
          footer: Text(""),
          decoration: pageDecoration),
      PageViewModel(
          // image:Image.asset("") ,
          title: "Page 3",
          body: "3",
          footer: Text(""),
          decoration: pageDecoration),
      PageViewModel(
          // image:Image.asset("") ,
          title: "Page 4",
          body: "4",
          footer: Text(""),
          decoration: pageDecoration),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.orangeAccent,
        animationDuration: 5,
        curve: Curves.bounceInOut,
        showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        dotsFlex: 1,
        dotsDecorator: DotsDecorator(
            size: const Size(25.0, 10.0),
            activeShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            activeSize: const Size(25.0, 10.0),
            color: Colors.brown,
            spacing: EdgeInsets.symmetric(horizontal: 1)),
        pages: getPages(),
        done: Text(
          "Start",
          style: TextStyle(color: Colors.white),
        ),
        skip: Text(
          "Skip",
          style: TextStyle(color: Colors.white),
        ),
        onDone: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => Menudashboardpage()));
        },
        onSkip: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => Menudashboardpage()));
        },
      ),
    );
  }
}
