import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:happymusic/constants/colors.dart';
import 'package:happymusic/models/music.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../animated_bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final Widget heightSpacer = const SizedBox(height: 10);
  final Widget widthSpacer = const SizedBox(width: 10);

  @override
  Widget build(BuildContext context) {
    String text = "New Releases";
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.menu),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: 80.h,
          color: ColorConstants.kDarkBackGround,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText("New Releases", "", context),
              heightSpacer,
              SizedBox(
                height: 140,
                width: 100.w,
                child: ListView.separated(
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return AlbumImageTitle(
                        radius: 50,
                        video: videos[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return widthSpacer;
                    }),
              ),
              heightSpacer,
              titleText("Popular", "More", context),
              heightSpacer,
              SizedBox(
                height: 150,
                width: 100.w,
                child: ListView.separated(
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return AlbumImageTitle(
                        radius: 10,
                        video: videos[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return widthSpacer;
                    }),
              ),
              heightSpacer,
              titleText("Favorite", "", context),
              heightSpacer,
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return const MusicListTile();
                  }),
              heightSpacer,
              titleText("Artist", "See All", context),
              heightSpacer,
              SizedBox(
                height: 150,
                width: 100.w,
                child: ListView.separated(
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return AlbumImageTitle(radius: 50, video: videos[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return widthSpacer;
                    }),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: ColorConstants.kDarkBackGround,
    );
  }

  SizedBox titleText(String title, String subTitle, BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}

class MusicListTile extends StatelessWidget {
  const MusicListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("Tum Milo To DIl Khile"),
      subtitle: const Text("By Arijit Singh"),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/music-album-cover-design-template-1b27d21f12b3ce9dceaccc1e663da8a9_screen.jpg?ts=1561485221",
          fit: BoxFit.fill,
          width: 60,
          height: 60,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.more_horiz),
        onPressed: () {},
      ),
    );
  }
}

class AlbumImageTitle extends ConsumerWidget {
  final double radius;
  final Video? video;
  final VoidCallback? onTap;

  const AlbumImageTitle({
    Key? key,
    required this.radius,
    required this.video,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedVideoProvider.state).state = video;
        if (onTap != null) onTap!();
      },
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: Image.network(
              video!.thumbnailUrl,
              fit: BoxFit.cover,
              width: radius == 10 ? 110 : 100,
              height: radius == 10 ? 110 : 100,
            ),
          ),
          titleSubtitleText(context, video!.title, Theme.of(context).textTheme.headline5!),
          titleSubtitleText(
              context, video!.author.username, Theme.of(context).textTheme.headline6!),
        ],
      ),
    );
  }

  SizedBox titleSubtitleText(BuildContext context, String text, TextStyle style) {
    return SizedBox(
      width: radius == 10 ? 110 : 100,
      child: Text(
        text,
        style: style,
        overflow: TextOverflow.clip,
        textAlign: TextAlign.center,
        maxLines: 1,
      ),
    );
  }
}


