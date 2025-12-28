// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:twitter_clone/constants/sizes.dart';
// import 'package:twitter_clone/features/main_navigation/widgets/nav_tab.dart';

// class MainNavigationScreen extends StatefulWidget {
//   static const String routeName = "mainNavigation";

//   final String tab;
//   const MainNavigationScreen({super.key, required this.tab});

//   @override
//   State<MainNavigationScreen> createState() => _MainNavigationScreenState();
// }

// class _MainNavigationScreenState extends State<MainNavigationScreen> {
//   @override
//   Widget build(BuildContext context) {
//         return Scaffold(
//       // appBar: AppBar(
//       //   title: FaIcon(FontAwesomeIcons.threads, color: Colors.black),
//       // ),
//       appBar: _selectedIndex == 0
//           ? AppBar(
//               title: FaIcon(
//                 FontAwesomeIcons.threads,
//                 // color: isDark ? Colors.white : Colors.black,
//               ),
//             )
//           : null,

//       body: Stack(
//         children: [
//           Offstage(
//             offstage: _selectedIndex != 0,
//             child: //StfScreen()
//             ListView.builder(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: Sizes.size16,
//                 vertical: Sizes.size8,
//               ),
//               itemCount: _posts.length,
//               itemBuilder: (context, index) {
//                 return PostCard(post: _posts[index]);
//               },
//             ),
//           ),
//           // Offstage(offstage: _selectedIndex != 1, child: StfScreen()),
//           Offstage(offstage: _selectedIndex != 1, child: SearchScreen()),

//           Offstage(offstage: _selectedIndex != 2, child: StfScreen()),
//           Offstage(offstage: _selectedIndex != 3, child: ActivityScreen()),
//           // Offstage(offstage: _selectedIndex != 4, child: UserProfileScreen()),
//           Offstage(
//             offstage: _selectedIndex != 4,
//             child: UserProfileScreen(username: "Jane"), //, tab: "Replies"),
//           ),
//         ],
//       ),

//       bottomNavigationBar: BottomAppBar(
//         // color: Colors.white,
//         child: Padding(
//           padding: EdgeInsets.all(Sizes.size12),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               NavTab(
//                 // text: "Home",
//                 isSelected: _selectedIndex == 0,
//                 icon: FontAwesomeIcons.house,
//                 selectedIcon: FontAwesomeIcons.house,
//                 onTap: () => _onTap(0),
//               ),
//               NavTab(
//                 isSelected: _selectedIndex == 1,
//                 icon: FontAwesomeIcons.magnifyingGlass,
//                 selectedIcon: FontAwesomeIcons.magnifyingGlass,
//                 onTap: () => _onTap(1),
//               ),
//               NavTab(
//                 isSelected: _selectedIndex == 2,
//                 icon: FontAwesomeIcons.penToSquare,
//                 selectedIcon: FontAwesomeIcons.solidPenToSquare,
//                 // onTap: () => _onTap(2),
//                 onTap: () => _onWriteTap(context),
//               ),
//               NavTab(
//                 isSelected: _selectedIndex == 3,
//                 icon: FontAwesomeIcons.heart,
//                 selectedIcon: FontAwesomeIcons.solidHeart,
//                 onTap: () => _onTap(3),
//               ),
//               NavTab(
//                 isSelected: _selectedIndex == 4,
//                 icon: FontAwesomeIcons.user,
//                 selectedIcon: FontAwesomeIcons.solidUser,
//                 onTap: () => _onTap(4),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );

//   }
// }
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/activity/activity_screen.dart';
import 'package:twitter_clone/features/main_navigation/home_screen.dart';
import 'package:twitter_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:twitter_clone/features/main_navigation/write_screen.dart';
import 'package:twitter_clone/features/searching/search_screen.dart';
import 'package:twitter_clone/features/user/user_profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = "mainNavigation";

  final String tab;
  const MainNavigationScreen({super.key, required this.tab});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = [
    "/", // home
    "search",
    "write",
    "activity",
    "profile",
  ];

  late int _selectedIndex = _tabs.indexOf(widget.tab);

  @override
  void didUpdateWidget(covariant MainNavigationScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 라우트로 들어온 tab이 바뀌면 selectedIndex도 동기화 (중요!)
    final newIndex = _tabs.indexOf(widget.tab);
    if (newIndex != -1 && newIndex != _selectedIndex) {
      setState(() => _selectedIndex = newIndex);
    }
  }

  void _onTap(int index) {
    // write 탭을 라우트로 이동시키지 않을 거면 분기
    if (index == 2) {
      _onWriteTap(context);
      return;
    }
    final location = _tabs[index].isEmpty ? "/" : "/${_tabs[index]}";
    context.go(location);
    // setState는 사실상 필요 없지만, 즉시 반응용으로 넣어도 됨
    setState(() => _selectedIndex = index);
  }

  void _onWriteTap(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      builder: (context) => WriteScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(title: FaIcon(FontAwesomeIcons.threads))
          : null,
      body: Stack(
        children: [
          Offstage(offstage: _selectedIndex != 0, child: HomeScreen()),
          Offstage(offstage: _selectedIndex != 1, child: SearchScreen()),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const ActivityScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: UserProfileScreen(username: "Jane"),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(Sizes.size12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
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
