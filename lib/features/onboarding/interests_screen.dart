import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/onboarding/interests_two_screen%20copy.dart';
import 'package:twitter_clone/features/onboarding/widgets/interest_box.dart';

const interests = [
  "Fashion & beauty",
  "Outdoors",
  "Arts & culture",
  "Animation & comics",
  "Business & finance",
  "Food",
  "Travel",
  "Enterrainment",
  "Music",
  "Gaming",
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  void _onNaxtTap() {
    // MaterialPageRoute(builder: (context) => InterestsScreen());
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InterestsTwoScreen(),

        // InterestsScreen(email: _formData["email"]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: FaIcon(FontAwesomeIcons.twitter)),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'What do you want to see on Twitter?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Gaps.v24,
                Text(
                  'Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.',
                ),
                // Text('Enter it below to verify\n${widget.email}'),
                Gaps.v16,
                Divider(height: 1, thickness: 0.5, color: Colors.grey.shade400),
                Gaps.v24,
                Wrap(
                  runSpacing: 15,
                  spacing: 15,
                  children: [
                    for (var interest in interests)
                      InterestBox(interest: interest),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      //   // controller: _scrollController,
      //   child: SingleChildScrollView(
      //     // controller: _scrollController,
      //     child: Padding(
      //       padding: EdgeInsets.only(
      //         left: Sizes.size24,
      //         right: Sizes.size24,
      //         bottom: Sizes.size16,
      //       ),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Gaps.v32,
      //           Text(
      //             "Choose your interests",
      //             style: TextStyle(
      //               fontSize: Sizes.size40,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //           Gaps.v20,
      //           Text(
      //             "Get better video recommendations",
      //             style: TextStyle(fontSize: Sizes.size20),
      //           ),
      //           Gaps.v64,
      //           Wrap(
      //             runSpacing: 15,
      //             spacing: 15,
      //             children: [
      //               for (var interest in interests)
      //                 InterestButton(interest: interest),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text('0 of 3 selected'),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              // onTap: _trackingEnabled ? _onNextTap : null,
              onTap: _onNaxtTap,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                width: Sizes.size96,

                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black,
                  // color: _trackingEnabled
                  //     ? Colors
                  //           .black //Theme.of(context).primaryColor
                  //     : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    // color: _trackingEnabled ? Colors.white : Colors.black38,
                    color: Colors.white, //: Colors.black38,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
