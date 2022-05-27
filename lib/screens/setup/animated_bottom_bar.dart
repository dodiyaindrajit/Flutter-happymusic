import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:happymusic/constants/colors.dart';
import 'package:happymusic/models/music.dart';
import 'package:happymusic/screens/home/home.dart';
import 'package:happymusic/screens/search/search.dart';
import 'package:happymusic/widgets/mini_player.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final selectedVideoProvider = StateProvider<Video?>((ref) => null);
final miniPlayerControllerProvider = StateProvider.autoDispose<MiniplayerController>(
  (ref) => MiniplayerController(),
);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List tabs = [];
  int currentTabIndex = 0;

  @override
  initState() {
    super.initState();
    tabs = [const HomeScreen(), const SearchScreen(), const SearchScreen()];
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Consumer(builder: (context, ref, _) {
        final selectedVideo = ref.watch(selectedVideoProvider);
        final miniPlayerController = ref.watch(miniPlayerControllerProvider);
        return Scaffold(
          body: tabs[currentTabIndex],
          backgroundColor: ColorConstants.kDarkBackGround,
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MiniPlayer(
                selectedVideo: selectedVideo,
                miniPlayerController: miniPlayerController,
                ref: ref,
              ),
              BottomNavigationBar(
                currentIndex: currentTabIndex,
                elevation: 0,
                onTap: (currentIndex) => setState(() => currentTabIndex = currentIndex),
                selectedItemColor: ColorConstants.kHighLightColor,
                unselectedItemColor: Color(0xFFE0D9B0),
                backgroundColor: ColorConstants.kDarkBackGround,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                  BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
                  BottomNavigationBarItem(icon: Icon(Icons.library_books), label: "")
                ],
              )
            ],
          ),
        );
      });
    });
  }
}
