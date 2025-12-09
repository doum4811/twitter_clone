import 'package:flutter/material.dart';
import 'package:twitter_clone/features/onboarding/widgets/interest_button.dart';

class InterestRow extends StatelessWidget {
  final List<String> items;
  const InterestRow(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (final item in items) ...[
              InterestButton(interest: item),
              const SizedBox(width: 8),
            ],
          ],
        ),
      ),
    );
  }
}
