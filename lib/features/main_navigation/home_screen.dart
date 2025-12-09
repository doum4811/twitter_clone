import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:twitter_clone/features/main_navigation/widgets/post_card.dart';
import 'package:twitter_clone/features/main_navigation/widgets/stf_screen.dart';

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
    imageUrls: ["https://picsum.photos/200/300?grayscale"],
    time: "7h",
    replies: 53,
    likes: 437,
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Post> _posts = dummyPosts;

  @override
  Widget build(BuildContext context) {
    print('im bulit!');
    return Scaffold(
      appBar: AppBar(
        title: FaIcon(FontAwesomeIcons.threads, color: Colors.black),
      ),
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: //StfScreen()
            ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
                vertical: Sizes.size8,
              ),
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return PostCard(post: _posts[index]);
              },
            ),
          ),
          Offstage(offstage: _selectedIndex != 1, child: StfScreen()),
          Offstage(offstage: _selectedIndex != 2, child: StfScreen()),
          Offstage(offstage: _selectedIndex != 3, child: StfScreen()),
          Offstage(offstage: _selectedIndex != 4, child: StfScreen()),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(Sizes.size12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                // text: "Home",
                isSelected: _selectedIndex == 0,
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                onTap: () => _onTap(0),
              ),
              NavTab(
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.magnifyingGlass,
                selectedIcon: FontAwesomeIcons.magnifyingGlass,
                onTap: () => _onTap(1),
              ),
              NavTab(
                isSelected: _selectedIndex == 2,
                icon: FontAwesomeIcons.penToSquare,
                selectedIcon: FontAwesomeIcons.solidPenToSquare,
                onTap: () => _onTap(2),
              ),
              NavTab(
                isSelected: _selectedIndex == 3,
                icon: FontAwesomeIcons.heart,
                selectedIcon: FontAwesomeIcons.solidHeart,
                onTap: () => _onTap(3),
              ),
              NavTab(
                isSelected: _selectedIndex == 4,
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
