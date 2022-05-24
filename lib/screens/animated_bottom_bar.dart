import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happymusic/constants/colors.dart';
import 'package:happymusic/constants/style.dart';
import 'package:happymusic/screens/cart/cart.dart';
import 'package:happymusic/screens/home/home.dart';
import 'package:happymusic/screens/search/search.dart';
import 'package:happymusic/screens/setting/setting.dart';
import 'package:just_audio/just_audio.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _audioPlayer = AudioPlayer();
  List Tabs = [];
  int currentTabIndex = 0;
  bool isPlaying = false;
  bool isShow = false;

  Widget miniPlayer({required bool isShow}) {
    print("$isShow --> Widget");
    return !isShow
        ? Container(
            color: Colors.red,
            height: 20,
            width: 100.w,
          )
        : AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            color: Colors.blueGrey,
            width: 100.w,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                    "https://www.designformusic.com/wp-content/uploads/2016/04/orion-trailer-music-album-cover-design.jpg",
                    fit: BoxFit.cover),
                Text(
                  "music.name",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                IconButton(
                    onPressed: () async {
                      isPlaying = !isPlaying;
                      if (isPlaying) {
                        await _audioPlayer.play();
                      } else {
                        await _audioPlayer.pause();
                      }
                      setState(() {});
                    },
                    icon: isPlaying
                        ? Icon(Icons.pause, color: Colors.white)
                        : Icon(Icons.play_arrow, color: Colors.white))
              ],
            ),
          );
  }

  @override
  initState() {
    super.initState();
    Tabs = [HomeScreen(miniPlayer), SearchScreen(), SearchScreen()];
  }

  // UI Design Code Goes inside Build
  @override
  Widget build(BuildContext context) {
    print("Lets Build it");
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Scaffold(
        body: Tabs[currentTabIndex],
        backgroundColor: Colors.black,
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100.w,
              alignment: Alignment.center,
              color: Colors.white70,
              child: Text(
                "Counter Value is :",
              ),
            ),
            BottomNavigationBar(
              currentIndex: currentTabIndex,
              onTap: (currentIndex) {
                print("Current Index is $currentIndex");
                currentTabIndex = currentIndex;
                setState(() {}); // re-render
              },
              selectedLabelStyle: TextStyle(color: Colors.white),
              selectedItemColor: Colors.white,
              backgroundColor: Colors.black45,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.white), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: Colors.white),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.library_books, color: Colors.white), label: 'Your Library')
              ],
            )
          ],
        ),
      );
    });
  }
}
