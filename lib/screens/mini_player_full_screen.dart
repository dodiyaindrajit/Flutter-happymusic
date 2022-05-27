// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:happymusic/models/music.dart';
// import 'package:happymusic/screens/setup/animated_bottom_bar.dart';
// import 'package:miniplayer/miniplayer.dart';
//
// class VideoScreen extends ConsumerWidget {
//   ScrollController? _scrollController;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return GestureDetector(
//       onTap: () => ref.read(miniPlayerControllerProvider).animateToHeight(state: PanelState.MAX),
//       child: Scaffold(
//         body: Container(
//           color: Colors.white,
//           child: CustomScrollView(
//             controller: _scrollController,
//             shrinkWrap: true,
//             slivers: [
//               SliverToBoxAdapter(
//                 child: Consumer(
//                   builder: (context, ref, _) {
//                     final selectedVideo = ref.watch(selectedVideoProvider);
//                     return SafeArea(
//                       child: Column(
//                         children: [
//                           Stack(
//                             children: [
//                               Image.network(
//                                 selectedVideo!.thumbnailUrl,
//                                 height: 220.0,
//                                 width: double.infinity,
//                                 fit: BoxFit.cover,
//                               ),
//                               IconButton(
//                                 iconSize: 30.0,
//                                 icon: const Icon(Icons.keyboard_arrow_down),
//                                 onPressed: () => ref
//                                     .read(miniPlayerControllerProvider)
//                                     .animateToHeight(state: PanelState.MIN),
//                               ),
//                             ],
//                           ),
//                           VideoInfo(video: selectedVideo),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               SliverList(
//                 delegate: SliverChildBuilderDelegate(
//                   (context, index) {
//                     final video = suggestedVideos[index];
//                     return VideoCard(
//                       video: video,
//                       hasPadding: true,
//                       onTap: () => _scrollController!.animateTo(
//                         0,
//                         duration: const Duration(milliseconds: 200),
//                         curve: Curves.easeIn,
//                       ),
//                     );
//                   },
//                   childCount: suggestedVideos.length,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class VideoCard extends ConsumerWidget {
//   final Video video;
//   final bool hasPadding;
//   final VoidCallback? onTap;
//
//   const VideoCard({
//     Key? key,
//     required this.video,
//     this.hasPadding = false,
//     this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return GestureDetector(
//       onTap: () {
//         ref.read(selectedVideoProvider.state).state = video;
//         ref.read(miniPlayerControllerProvider).animateToHeight(state: PanelState.MAX);
//         if (onTap != null) onTap!();
//       },
//       child: Column(
//         children: [
//           Stack(
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: hasPadding ? 12.0 : 0,
//                 ),
//                 child: Image.network(
//                   video.thumbnailUrl,
//                   height: 220.0,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Positioned(
//                 bottom: 8.0,
//                 right: hasPadding ? 20.0 : 8.0,
//                 child: Container(
//                   padding: const EdgeInsets.all(4.0),
//                   color: Colors.black,
//                   child: Text(
//                     video.duration,
//                     style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: () => print('Navigate to profile'),
//                   child: CircleAvatar(
//                     foregroundImage: NetworkImage(video.author.profileImageUrl),
//                   ),
//                 ),
//                 const SizedBox(width: 8.0),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Flexible(
//                         child: Text(
//                           video.title,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.0),
//                         ),
//                       ),
//                       Flexible(
//                         child: Text(
//                           '${video.author.username} • ${video.viewCount} views •}',
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14.0),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {},
//                   child: const Icon(Icons.more_vert, size: 20.0),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class VideoInfo extends StatelessWidget {
//   final Video video;
//
//   const VideoInfo({
//     Key? key,
//     required this.video,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             video.title,
//             style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.0),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 8.0),
//           Text(
//             '${video.viewCount} views •',
//             style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14.0),
//           ),
//           const Divider(),
//           _ActionsRow(video: video),
//           const Divider(),
//           _AuthorInfo(user: video.author),
//           const Divider(),
//         ],
//       ),
//     );
//   }
// }
//
// class _ActionsRow extends StatelessWidget {
//   final Video video;
//
//   const _ActionsRow({
//     Key? key,
//     required this.video,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         _buildAction(context, Icons.thumb_up_outlined, video.likes),
//         _buildAction(context, Icons.thumb_down_outlined, video.dislikes),
//         _buildAction(context, Icons.reply_outlined, 'Share'),
//         _buildAction(context, Icons.download_outlined, 'Download'),
//         _buildAction(context, Icons.library_add_outlined, 'Save'),
//       ],
//     );
//   }
//
//   Widget _buildAction(BuildContext context, IconData icon, String label) {
//     return GestureDetector(
//       onTap: () {},
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon),
//           const SizedBox(height: 6.0),
//           Text(
//             label,
//             style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _AuthorInfo extends StatelessWidget {
//   final User user;
//
//   const _AuthorInfo({
//     Key? key,
//     required this.user,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => print('Navigate to profile'),
//       child: Row(
//         children: [
//           CircleAvatar(
//             foregroundImage: NetworkImage(user.profileImageUrl),
//           ),
//           const SizedBox(width: 8.0),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Flexible(
//                   child: Text(
//                     user.username,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.0),
//                   ),
//                 ),
//                 Flexible(
//                   child: Text(
//                     '${user.subscribers} subscribers',
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14.0),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           TextButton(
//             onPressed: () {},
//             child: Text(
//               'SUBSCRIBE',
//               style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.red),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
