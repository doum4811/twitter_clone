import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/utils.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    // required this.text,
    required this.isSelected,
    required this.icon,
    required this.onTap,
    required this.selectedIcon,
  });

  // final String text;
  final bool isSelected;
  final IconData icon;
  final IconData selectedIcon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          // color: Colors.white,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: isSelected ? 1 : 0.6,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  isSelected ? selectedIcon : icon,
                ), // color: Colors.black),
                Gaps.v5,
                // Text(text, style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
