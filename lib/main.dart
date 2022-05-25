import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:happymusic/constants/colors.dart';
import 'package:happymusic/route/route.dart';

void main() {
  runApp(const ProviderScope(child: HappyMusic()));
}

class HappyMusic extends StatelessWidget {
  const HappyMusic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            accentColor: Colors.red,
            primarySwatch: ColorConstants.kHighLightColorMaterial,
          ),
          appBarTheme: const AppBarTheme(
              color: ColorConstants.kDarkBackGround,
              iconTheme: IconThemeData(color: ColorConstants.kLightFontColor)),
          primaryColor: Colors.yellow,
          textTheme: const TextTheme(
            headline4: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            headline5: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 16),
          ).apply(
              bodyColor: ColorConstants.kLightFontColor,
              displayColor: ColorConstants.kLightFontColor,
              ),
          iconTheme: const IconThemeData(color: ColorConstants.kLightFontColor)),
      color: ColorConstants.kDarkBackGround,
      home: RouteController.initialScreen,
    );
  }
}
