import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:happymusic/constants/colors.dart';
import 'package:happymusic/models/music.dart';
import 'package:happymusic/screens/search/search.dart';
import 'package:happymusic/screens/setup/animated_bottom_bar.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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

  static final double _playerMinHeight = 6.5.h;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFADD5EA),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(1, 2),
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
                              child: Text(selectedVideo!.artist,
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
