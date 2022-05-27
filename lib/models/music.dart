class User {
  final String username;
  final String profileImageUrl;
  final String subscribers;

  const User({
    required this.username,
    required this.profileImageUrl,
    required this.subscribers,
  });
}

const User currentUser = User(
  username: 'Marcus Ng',
  profileImageUrl:
      'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
  subscribers: '100K',
);

class Video {
  final String id;
  final User author;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final DateTime timestamp;
  final String viewCount;
  final String likes;
  final String artist;

  const Video({
    required this.id,
    required this.author,
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.timestamp,
    required this.viewCount,
    required this.likes,
    required this.artist,
  });
}

final List<Video> videos = [
  Video(
    id: 'x606y4QWrxo',
    author: currentUser,
    title: 'Barish BanJana',
    thumbnailUrl:
        'https://www.bollywoodhungama.com/wp-content/uploads/2021/05/Shaheer-Sheikh-unveils-the-poster-of-his-new-music-video-Baarish-Ban-Jaana-starring-Hina-Khan-2.jpg',
    duration: '8:20',
    timestamp: DateTime(2021, 3, 20),
    viewCount: '10K',
    likes: '958',
    artist: 'Arijit Singh',
  ),
  Video(
    id: 'rJKN_880b-M',
    author: currentUser,
    title: 'Filhall Romatic Song',
    thumbnailUrl: 'https://pbs.twimg.com/media/EImx30RUEAIikeY.jpg',
    duration: '1:13:15',
    timestamp: DateTime(2020, 8, 22),
    viewCount: '32K',
    likes: '1.9k',
    artist: 'Sonu Nigam',
  ),
  Video(
    id: 'HvLb5gdUfDE',
    author: currentUser,
    title: 'Humnava Mere Tu he to chale',
    thumbnailUrl: 'https://i.pinimg.com/originals/60/9a/80/609a8061a8ae93f2735f3e3e20190b90.jpg',
    duration: '1:52:12',
    timestamp: DateTime(2020, 8, 7),
    viewCount: '190K',
    likes: '9.3K',
    artist: 'Saan',
  ),
  Video(
    id: 'h-igXZCCrrc',
    author: currentUser,
    title: 'Humraah',
    thumbnailUrl:
        'https://filmfare.wwmindia.com/content/2021/jun/new-bollywood-songs-humraah-91623939760.jpg',
    duration: '1:03:58',
    timestamp: DateTime(2019, 10, 17),
    viewCount: '358K',
    likes: '20k',
    artist: 'Shreya Gossal',
  ),
  Video(
    author: currentUser,
    id: 'vrPk6LB9bjo',
    title: 'Raabta',
    thumbnailUrl: 'https://i.pinimg.com/originals/0a/65/c3/0a65c353d55bc5e7d6afa5731841e527.jpg',
    duration: '22:06',
    timestamp: DateTime(2021, 2, 26),
    viewCount: '8K',
    likes: '485',
    artist: 'Sakar Raval',
  ),
];

final List<Video> suggestedVideos = [
  Video(
    id: 'rJKN_880b-M',
    author: currentUser,
    title: 'Flutter Netflix Clone Responsive UI Tutorial | Web and Mobile',
    thumbnailUrl:
        'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/cool-music-album-cover-design-template-3324b2b5c69bb9a3cfaed14c71f24ca8_screen.jpg?ts=1572456482',
    duration: '1:13:15',
    timestamp: DateTime(2020, 8, 22),
    viewCount: '32K',
    likes: '1.9k',
    artist: 'Darshan Raval',
  ),
  Video(
    id: 'HvLb5gdUfDE',
    author: currentUser,
    title: 'Flutter Facebook Clone Responsive UI Tutorial | Web and Mobile',
    thumbnailUrl:
        'https://image.shutterstock.com/image-vector/vector-music-poster-vinyl-record-600w-1599921352.jpg',
    duration: '1:52:12',
    timestamp: DateTime(2020, 8, 7),
    viewCount: '190K',
    likes: '9.3K',
    artist: '45',
  ),
  Video(
    id: 'h-igXZCCrrc',
    author: currentUser,
    title: 'Flutter Chat UI Tutorial | Apps From Scratch',
    thumbnailUrl:
        'https://www.designformusic.com/wp-content/uploads/2016/04/orion-trailer-music-album-cover-design.jpg',
    duration: '1:03:58',
    timestamp: DateTime(2019, 10, 17),
    viewCount: '358K',
    likes: '20k',
    artist: '85',
  ),
];
