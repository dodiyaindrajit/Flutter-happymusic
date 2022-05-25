import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:happymusic/constants/colors.dart';
import 'package:happymusic/models/music.dart';
import 'package:happymusic/screens/home/home.dart';
import 'package:happymusic/screens/search/search.dart';
import 'package:just_audio/just_audio.dart';
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
  final _audioPlayer = AudioPlayer();
  List tabs = [];
  int currentTabIndex = 0;
  bool isPlaying = false;
  bool isShow = false;

  Widget miniPlayer({required bool isShow}) {
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
                const Text(
                  "music.name",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
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
                        ? const Icon(Icons.pause, color: Colors.white)
                        : const Icon(Icons.play_arrow, color: Colors.white))
              ],
            ),
          );
  }

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
                  ref: ref),
              BottomNavigationBar(
                currentIndex: currentTabIndex,
                elevation: 0,
                onTap: (currentIndex) => setState(() {
                  currentTabIndex = currentIndex;
                }),
                selectedLabelStyle: const TextStyle(color: Colors.white),
                selectedItemColor: ColorConstants.kDarkFontColor,
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

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({
    Key? key,
    required this.selectedVideo,
    required this.miniPlayerController,
    required this.ref,
  }) : super(key: key);

  final Video? selectedVideo;
  final MiniplayerController miniPlayerController;
  final WidgetRef ref;

  static double _playerMinHeight = 6.5.h;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          const BoxShadow(
            color: Color(0xFF888484),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(1, 2), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.all(8),
      clipBehavior: Clip.antiAlias,
      child: Offstage(
        offstage: selectedVideo == null,
        child: Miniplayer(
          controller: miniPlayerController,
          minHeight: 6.5.h,
          maxHeight: 80.h,
          builder: (height, percentage) {
            if (selectedVideo == null) return const SizedBox.shrink();
            if (height <= _playerMinHeight + 30.0) {
              return Container(
                // color: ColorConstants.kDarkBackGround,
                decoration: BoxDecoration(
                  color: ColorConstants.kDarkBackGround,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: const Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.3.h / 2),
                        child: Image.network(
                          selectedVideo!.thumbnailUrl,
                          fit: BoxFit.cover,
                          width: 6.3.h - 5,
                          height: 6.3.h - 5,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                selectedVideo!.title,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                            Flexible(
                              child: Text(selectedVideo!.author.username,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.headline6),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.play_arrow),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        ref.read(selectedVideoProvider.state).state = null;
                      },
                    ),
                  ],
                ),
              );
            }
            return const SearchScreen();
          },
        ),
      ),
    );
  }
}
