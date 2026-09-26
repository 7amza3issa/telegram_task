enum MediaType { image, video }

class PostModel {
  final String id;
  final String mediaPath;
  final MediaType mediaType;
  final int viewsCount;

  PostModel({
    required this.id,
    required this.mediaPath,
    required this.mediaType,
    this.viewsCount = 0,
  });
}

class UserProfileModel {
  final String name;
  final String username;
  final String phoneNumber;
  final String bio;
  final String birthday;
  final String? profileAvatarPath;
  final bool isOnline;
  final List<PostModel> posts;
  final List<PostModel> archivedPosts;

  UserProfileModel({
    required this.name,
    required this.username,
    required this.phoneNumber,
    required this.bio,
    required this.birthday,
    this.profileAvatarPath,
    required this.isOnline,
    required this.posts,
    required this.archivedPosts,
  });

  factory UserProfileModel.mock() {
    return UserProfileModel(
      name: "7amza 3issa",
      username: "@dev7amza",
      phoneNumber: "+963 936148782",
      bio: "Flutter & Mobile Developer",
      birthday: "Jun 19 2003",
      profileAvatarPath: 'assets/images/profile_avatar.gif',
      isOnline: true,
      posts: [
        PostModel(
          id: "1",
          mediaPath: 'assets/images/post1.jpg',
          mediaType: MediaType.image,
          viewsCount: 150,
        ),
        PostModel(
          id: "2",
          mediaPath: 'assets/videos/post2.mp4',
          mediaType: MediaType.video,
          viewsCount: 1200,
        ),
      ],
      archivedPosts: [
        PostModel(
          id: "1",
          mediaPath: 'assets/videos/post3.mp4',
          mediaType: MediaType.video,
          viewsCount: 450,
        ),
        PostModel(
          id: "2",
          mediaPath: 'assets/videos/post4.mp4',
          mediaType: MediaType.video,
          viewsCount: 890,
        ),
      ],
    );
  }
}
