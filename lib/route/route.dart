import 'package:flutter/material.dart';
import 'package:happymusic/screens/setup/animated_bottom_bar.dart';
import 'package:happymusic/screens/setup/splash.dart';

// Define Routes
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class RouteController {
  //Initial Route
  static const Widget initialScreen = SplashScreen();

  //Define Screens
  static const String animateScreen = "animatedBottomBar";

  addScreen(String screenName, BuildContext context) {
    switch (screenName) {
      case animateScreen:
        return pushNewScreen(
          context,
          screen: MyApp(),
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      default:
        throw ('This route name does not exit');
    }
  }
}
