import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happymusic/constants/colors.dart';
import 'package:happymusic/constants/style.dart';
import 'package:happymusic/screens/cart/cart.dart';
import 'package:happymusic/screens/home/home.dart';
import 'package:happymusic/screens/search/search.dart';
import 'package:happymusic/screens/setting/setting.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AnimatedBottomBar extends StatelessWidget {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Icon> fontAwesomeIcons = [
    const Icon(Icons.music_note),
    const Icon(Icons.library_music),
    const Icon(Icons.queue_music_sharp),
    const Icon(Icons.music_video_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [
        const HomeScreen(),
        const SearchScreen(),
        const CartScreen(),
        const SettingScreen(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        for (var icon in fontAwesomeIcons)
          PersistentBottomNavBarItem(
            icon: icon,
            activeColorPrimary: ColorConstants.kHighLightColor,
            inactiveColorPrimary: Colors.white,
          ),
      ];
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: StyleConstants.navigationBarStyleGray,
      sized: false,
      child: ResponsiveSizer(builder: (context, orientation, screenType) {
        return Scaffold(
          backgroundColor: ColorConstants.kBackGround,
          body: SafeArea(
            child: PersistentTabView(
              context,
              controller: _controller,
              screens: _buildScreens(),
              items: _navBarsItems(),
              confineInSafeArea: true,
              // bottomScreenMargin: 10,
              navBarHeight: 40,
              // decoration: NavBarDecoration(
              //   borderRadius: BorderRadius.circular(15.0),
              // ),
              popAllScreensOnTapOfSelectedTab: true,
              popActionScreens: PopActionScreensType.all,
              itemAnimationProperties: const ItemAnimationProperties(
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              ),
              screenTransitionAnimation: const ScreenTransitionAnimation(
                animateTabTransition: true,
                curve: Curves.ease,
                duration: Duration(milliseconds: 500),
              ),
              navBarStyle: NavBarStyle.style6,
              onItemSelected: (index) {},
              backgroundColor: ColorConstants.kBackGround,
              padding: NavBarPadding.only(top: 10),
              bottomScreenMargin: 40,
            ),
          ),
        );
      }),
    );
  }
}
