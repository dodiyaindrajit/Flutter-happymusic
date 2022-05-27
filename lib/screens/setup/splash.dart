import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happymusic/constants/colors.dart';
import 'package:happymusic/constants/style.dart';
import 'package:happymusic/route/route.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static bool isNotNavigate = true;

  @override
  Widget build(BuildContext context) {
    if (isNotNavigate) {
      isNotNavigate = false;
      Future.delayed(const Duration(seconds: 2), () {
        RouteController().addScreen(RouteController.animateScreen, context);
      });
    }
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: StyleConstants.navigationBarStyleWhite,
      child: Container(
        color: ColorConstants.kHighLightColor,
        child: Center(
          child: Image.network(
              "https://lh3.googleusercontent.com/k5yRXhGXw3IqrbKwgIGN8oOjpMxSLW1Gsbw65H_ZdHRa0-bBFSqKxPQKO3LTdJy0LNY"),
        ),
      ),
    );
  }
}
