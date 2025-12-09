import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';

class InterestBox extends StatelessWidget {
  final String interest;
  final bool isSelected;
  final VoidCallback onTap;

  const InterestBox({
    super.key,
    required this.interest,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: _onTap,
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),

        // constraints: const BoxConstraints(minHeight: 90),
        padding: EdgeInsets.symmetric(
          vertical: Sizes.size20,
          horizontal: Sizes.size24,
        ),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          // color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          color: isSelected ? Theme.of(context).primaryColor : Colors.white,

          borderRadius: BorderRadius.circular(Sizes.size16),
          border: Border.all(color: Colors.black.withValues(alpha: 0.15)),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withValues(alpha: 0.05),
          //     blurRadius: 5,
          //     spreadRadius: 5,
          //   ),
          // ],
        ),
        child: Text(
          // widget.interest,
          interest,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            // color: _isSelected ? Colors.white : Colors.black87,
            color: isSelected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
