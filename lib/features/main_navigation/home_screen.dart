import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:twitter_clone/features/main_navigation/widgets/stf_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    print('im bulit!');
    return Scaffold(
      appBar: AppBar(title: FaIcon(FontAwesomeIcons.threads)),
      body: //screens.elementAt(_selectedIndex),
      Stack(
        children: [
          Offstage(offstage: _selectedIndex != 0, child: StfScreen()),
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
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavTab(
                // text: "Home",
                isSelected: _selectedIndex == 0,
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                onTap: () => _onTap(0),
              ),
              NavTab(
                // text: "Discover",
                isSelected: _selectedIndex == 1,
                // icon: FontAwesomeIcons.magnifyingGlass,
                icon: FontAwesomeIcons.magnifyingGlass,
                selectedIcon: FontAwesomeIcons.magnifyingGlass,
                onTap: () => _onTap(1),
              ),
              // Gaps.h24,
              // GestureDetector(
              //   onTap: _onPostVideoButtonTap,
              //   child: PostVideoButton(),
              // ),
              NavTab(
                // text: "Inbox",
                isSelected: _selectedIndex == 2,
                icon: FontAwesomeIcons.penToSquare,
                selectedIcon: FontAwesomeIcons.solidPenToSquare,
                onTap: () => _onTap(2),
              ),
              // Gaps.h24,
              NavTab(
                // text: "Inbox",
                isSelected: _selectedIndex == 3,
                icon: FontAwesomeIcons.heart,
                selectedIcon: FontAwesomeIcons.solidHeart,
                onTap: () => _onTap(3),
              ),
              NavTab(
                // text: "Profile",
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
