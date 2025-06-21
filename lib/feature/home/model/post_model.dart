class Post {
  String? username;
  String? description;
  String? totalLike;
  String? totalComment;
  String? totalBookmark;
  String? totalShare;
  String? videoUrl;

  Post({
    required this.username,
    required this.description,
    required this.totalLike,
    required this.totalComment,
    required this.totalBookmark,
    required this.totalShare,
    required this.videoUrl,
  });
}

List<Post> listPost = [
  Post(
    username: 'Leonardo Davinci',
    description: "Big Buck Bunny tells the story of a giant rabbit with a heart bigger than himself. #12#Bunny# #13#AI#",
    totalLike: '12.5k',
    totalComment: '12k',
    totalBookmark: '1042',
    totalShare: '2010',
    videoUrl: 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  ),
  Post(
    username: 'Ronaldo',
    description: "The first Blender Open Movie from 2006. #14#Elephant#",
    totalLike: '10.5k',
    totalComment: '11.2k',
    totalBookmark: '100',
    totalShare: '201',
    videoUrl: 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
  ),
  Post(
    username: 'HBO GO',
    description: "HBO GO now works with Chromecast -- the easiest way to enjoy online video on your TV. For when you want to settle into your Iron Throne to watch the latest episodes. For \$35.\nLearn how to use Chromecast with HBO GO and more at google.com/chromecast.",
    totalLike: '101',
    totalComment: '920',
    totalBookmark: '100',
    totalShare: '201',
    videoUrl: 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
  ),
];
