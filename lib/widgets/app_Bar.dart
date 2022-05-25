import 'package:flutter/material.dart';
import 'package:happymusic/constants/colors.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AppBar(
        backgroundColor: ColorConstants.kDarkBackGround,
        elevation: 0,
        title: const Text(
          'Happy Music',
          style: TextStyle(color: ColorConstants.kDarkBackGround),
        ),
      ),
    );
  }
}
