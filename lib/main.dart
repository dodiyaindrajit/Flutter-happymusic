import 'package:flutter/material.dart';
import 'package:happymusic/constants/colors.dart';
import 'package:happymusic/route/route.dart';

void main() {
  runApp(const HappyMusic());
}

class HappyMusic extends StatelessWidget {
  const HappyMusic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            accentColor: ColorConstants.kPrimaryColor,
            primarySwatch: ColorConstants.kHighLightColorMaterial,
          ),
          primaryColor: ColorConstants.kPrimaryColor,
          textTheme: const TextTheme(
            headline6: TextStyle(color: ColorConstants.kHighLightColor),
            bodyText1: TextStyle(color: ColorConstants.kHighLightColor),
          ).apply(
            bodyColor: ColorConstants.kHighLightColor,
            displayColor: Colors.blue,
          ),
          iconTheme: const IconThemeData(color: ColorConstants.kHighLightColor)),
      color: ColorConstants.kPrimaryColor,
      home: RouteController.initialScreen,
    );
  }
}
