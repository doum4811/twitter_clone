// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:go_router/go_router.dart';
// import 'package:twitter_clone/constants/sizes.dart';
// import 'package:twitter_clone/features/activity/activity_screen.dart';
// import 'package:twitter_clone/features/main_navigation/widgets/nav_tab.dart';
// import 'package:twitter_clone/features/main_navigation/widgets/post_card.dart';
// import 'package:twitter_clone/features/main_navigation/widgets/stf_screen.dart';
// import 'package:twitter_clone/features/main_navigation/write_screen.dart';
// import 'package:twitter_clone/features/searching/search_screen.dart';
// import 'package:twitter_clone/features/user/user_profile_screen.dart';
// import 'package:twitter_clone/utils.dart';

// // 테스트용 더미 데이터
// const dummyPosts = [
//   Post(
//     userName: "pubity",
//     avatarUrl: "https://picsum.photos/seed/avatar1/80/80",
//     isPremium: true,
//     content: "Vine after seeing the Threads logo unveiled",
//     imageUrls: ["https://picsum.photos/536/354"],
//     time: "2m",
//     replies: 36,
//     likes: 391,
//   ),
//   Post(
//     userName: "thetinderblog",
//     avatarUrl: "https://picsum.photos/seed/avatar2/80/80",
//     isPremium: false,
//     content: "Elon alone on Twitter right now...",
//     imageUrls: ["https://picsum.photos/200/300/?blur=2"],
//     time: "5m",
//     replies: 0,
//     likes: 0,
//   ),
//   Post(
//     userName: "tropicalseductions",
//     avatarUrl: "https://picsum.photos/seed/avatar3/80/80",
//     isPremium: true,
//     content: "Drop a comment here to test things out.",
//     // imageUrls: [], // 텍스트만
//     imageUrls: [
//       // "https://picsum.photos/seed/1/800/800",
//       "https://picsum.photos/536/355",
//     ],
//     time: "2h",
//     replies: 2,
//     likes: 4,
//   ),
//   Post(
//     userName: "shityoushouldcareabout",
//     avatarUrl: "https://picsum.photos/seed/avatar4/80/80",
//     isPremium: true,
//     content: "my phone feels like a vibrator with all these notifications rn",
//     imageUrls: [
//       "https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI",
//     ],
//     time: "2h",
//     replies: 64,
//     likes: 631,
//   ),
//   Post(
//     userName: "_plantswithkrystal_",
//     avatarUrl: "https://picsum.photos/seed/avatar5/80/80",
//     isPremium: true,
//     content:
//         "If you're reading this, go water that thirsty plant. You're welcom",
//     imageUrls: ["https://picsum.photos/id/237/200/300"],
//     time: "2h",
//     replies: 8,
//     likes: 74,
//   ),
//   Post(
//     userName: "terracottacoco",
//     avatarUrl: "https://picsum.photos/seed/avatar6/80/80",
//     isPremium: true,
//     content: "",
//     imageUrls: [
//       "https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI",
//     ],
//     time: "2h",
//     replies: 23,
//     likes: 325,
//   ),
//   Post(
//     userName: "timferriss",
//     avatarUrl: "https://picsum.photos/seed/avatar7/80/80",
//     isPremium: true,
//     content: "Photoshoot with Molly pup.:)",
//     imageUrls: [
//       "https://picsum.photos/210/300?grayscale",
//       "https://picsum.photos/220/300?grayscale",
//       "https://picsum.photos/230/300?grayscale",
//     ],
//     time: "7h",
//     replies: 53,
//     likes: 437,
//   ),
// ];

// class HomeScreen extends StatefulWidget {
//   static String routeURL = "/";
//   static String routeName = "homeScreen";
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   void _onTap(int index) {
//     if (index == 0) {
//       context.pushNamed(HomeScreen.routeName);
//       // context.go(HomeScreen.routeName);

//       return;
//     } else if (index == 1) {
//       context.pushNamed(SearchScreen.routeName);
//       // context.go(SearchScreen.routeName);
//       return;
//     } else if (index == 3) {
//       context.pushNamed(ActivityScreen.routeName);
//       // context.go(ActivityScreen.routeName);

//       return;
//     } else if (index == 4) {
//       context.goNamed(UserProfileScreen.routeName, params: {"username": "니꼬"});
//       // context.go(UserProfileScreen.routeName);

//       return;
//     }
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   final List<Post> _posts = dummyPosts;

//   void _onWriteTap(BuildContext context) async {
//     // if (_videoPlayerController.value.isPlaying) {
//     //   _onTogglePause();
//     // }
//     await showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       barrierColor: Colors.transparent, //Colors.red,
//       //
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(Sizes.size14),
//       ), // 이 부분을 추가해야 모서리가 둥그렇게 됨
//       builder: (context) => WriteScreen(), //Container()
//     );
//     // print('closed');
//     // _onTogglePause();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('im bulit!');
//     final isDark = isDarkMode(context);

//   }
// }
import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/main_navigation/widgets/post_card.dart';

// 테스트용 더미 데이터
const dummyPosts = [
  Post(
    userName: "pubity",
    avatarUrl: "https://picsum.photos/seed/avatar1/80/80",
    isPremium: true,
    content: "Vine after seeing the Threads logo unveiled",
    imageUrls: ["https://picsum.photos/536/354"],
    time: "2m",
    replies: 36,
    likes: 391,
  ),
  Post(
    userName: "thetinderblog",
    avatarUrl: "https://picsum.photos/seed/avatar2/80/80",
    isPremium: false,
    content: "Elon alone on Twitter right now...",
    imageUrls: ["https://picsum.photos/200/300/?blur=2"],
    time: "5m",
    replies: 0,
    likes: 0,
  ),
  Post(
    userName: "tropicalseductions",
    avatarUrl: "https://picsum.photos/seed/avatar3/80/80",
    isPremium: true,
    content: "Drop a comment here to test things out.",
    // imageUrls: [], // 텍스트만
    imageUrls: [
      // "https://picsum.photos/seed/1/800/800",
      "https://picsum.photos/536/355",
    ],
    time: "2h",
    replies: 2,
    likes: 4,
  ),
  Post(
    userName: "shityoushouldcareabout",
    avatarUrl: "https://picsum.photos/seed/avatar4/80/80",
    isPremium: true,
    content: "my phone feels like a vibrator with all these notifications rn",
    imageUrls: [
      "https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI",
    ],
    time: "2h",
    replies: 64,
    likes: 631,
  ),
  Post(
    userName: "_plantswithkrystal_",
    avatarUrl: "https://picsum.photos/seed/avatar5/80/80",
    isPremium: true,
    content:
        "If you're reading this, go water that thirsty plant. You're welcom",
    imageUrls: ["https://picsum.photos/id/237/200/300"],
    time: "2h",
    replies: 8,
    likes: 74,
  ),
  Post(
    userName: "terracottacoco",
    avatarUrl: "https://picsum.photos/seed/avatar6/80/80",
    isPremium: true,
    content: "",
    imageUrls: [
      "https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI",
    ],
    time: "2h",
    replies: 23,
    likes: 325,
  ),
  Post(
    userName: "timferriss",
    avatarUrl: "https://picsum.photos/seed/avatar7/80/80",
    isPremium: true,
    content: "Photoshoot with Molly pup.:)",
    imageUrls: [
      "https://picsum.photos/210/300?grayscale",
      "https://picsum.photos/220/300?grayscale",
      "https://picsum.photos/230/300?grayscale",
    ],
    time: "7h",
    replies: 53,
    likes: 437,
  ),
];

class HomeScreen extends StatelessWidget {
  static String routeURL = "/";
  static String routeName = "home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size16,
        vertical: Sizes.size8,
      ),
      itemCount: dummyPosts.length,
      itemBuilder: (context, index) => PostCard(post: dummyPosts[index]),
    );
  }
}
