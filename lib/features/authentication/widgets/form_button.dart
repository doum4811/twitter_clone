import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({super.key, required this.disabled});

  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: null,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              backgroundColor: Colors.grey.shade300,
              foregroundColor: Colors.white,
              shape: const StadiumBorder(),
            ),
            child: const Text(
              "Next",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );

    // return FractionallySizedBox(
    //   widthFactor: 1,
    //   child: AnimatedContainer(
    //     padding: EdgeInsets.symmetric(vertical: Sizes.size16),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(Sizes.size5),
    //       color: disabled
    //           ? Colors.grey.shade300
    //           : Theme.of(context).primaryColor,
    //     ),
    //     duration: Duration(milliseconds: 500),
    //     child: AnimatedDefaultTextStyle(
    //       duration: Duration(milliseconds: 500),
    //       style: TextStyle(
    //         color: disabled ? Colors.grey.shade400 : Colors.white,
    //         fontWeight: FontWeight.w600,
    //       ),
    //       child: Text('Next', textAlign: TextAlign.center),
    //     ),
    //   ),
    // );
  }
}
