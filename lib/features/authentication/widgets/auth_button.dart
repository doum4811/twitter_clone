import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/src/fa_icon.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/utils.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon? icon;

  const AuthButton({super.key, required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    final hasIcon = icon != null;

    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        padding: EdgeInsets.all(Sizes.size14),
        decoration: BoxDecoration(
          color: hasIcon || isDarkMode(context) ? Colors.white : Colors.black,
          borderRadius: BorderRadius.circular(45),
          border: hasIcon
              ? Border.all(color: Colors.grey.shade300, width: Sizes.size1)
              : null,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(alignment: Alignment.centerLeft, child: icon),
            Text(
              text,
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
                color: hasIcon || isDarkMode(context)
                    ? Colors.black
                    : Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
