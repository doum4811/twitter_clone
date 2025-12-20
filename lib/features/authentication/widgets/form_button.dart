import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/utils.dart';

class FormButton extends StatelessWidget {
  const FormButton({super.key, required this.disabled});

  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: Sizes.size24, bottom: Sizes.size10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: null,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size24,
                vertical: Sizes.size12,
              ),
              backgroundColor: disabled || isDarkMode(context)
                  ? const Color(0xFFD9DBE0)
                  : Colors.black,
              foregroundColor: disabled || isDarkMode(context)
                  ? const Color(0xFF87909A)
                  : Colors.white,
              shape: const StadiumBorder(),
            ),
            child: Text(
              "Next",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isDarkMode(context) ? Colors.black : Color(0xFFc0c2c4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
