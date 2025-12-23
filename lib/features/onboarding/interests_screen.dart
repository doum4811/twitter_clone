import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/onboarding/interests_two_screen.dart';
import 'package:twitter_clone/features/onboarding/widgets/interest_box.dart';
import 'package:twitter_clone/utils.dart';

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
  final Set<String> _selectedInterests = {};

  bool get _isNextEnabled => _selectedInterests.length >= 3;

  void _onInterestTap(String interest) {
    setState(() {
      if (_selectedInterests.contains(interest)) {
        _selectedInterests.remove(interest);
      } else {
        _selectedInterests.add(interest);
      }
    });
  }

  void _onNextTap() {
    // MaterialPageRoute(builder: (context) => InterestsScreen());
    if (!_isNextEnabled) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InterestsTwoScreen(),

        // InterestsScreen(email: _formData["email"]),
      ),
    );
  }

  double _boxWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const horizontalPadding = 25.0; // InterestsScreen에서 준 padding
    const horizontalSpacing = 15.0; // Wrap에서 spacing
    // 양쪽 패딩 + 가운데 spacing 빼고 2등분
    return (screenWidth - horizontalPadding * 2 - horizontalSpacing) / 2;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: isDark ? Colors.white : const Color(0xFF4693db),
        ),
      ),
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
                  // children: [
                  //   for (var interest in interests)
                  //     InterestBox(interest: interest),
                  // ],
                  children: [
                    for (final interest in interests)
                      SizedBox(
                        width: _boxWidth(context),
                        height: 90,
                        child: InterestBox(
                          interest: interest,
                          isSelected: _selectedInterests.contains(interest),
                          onTap: () => _onInterestTap(interest),
                        ),
                      ),
                  ],
                ),
                Gaps.v16,
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
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
          ),

          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                // Text('0 of 3 selected'),
                Padding(
                  // padding: const EdgeInsets.only(left: 24),
                  padding: EdgeInsets.all(24),
                  child: Text(
                    '${_selectedInterests.length} of 3 selected',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: _isNextEnabled ? _onNextTap : null,
                  // onTap: _onNextTap,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    width: Sizes.size96,

                    height: 48,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      // color: Colors.black,
                      color: _isNextEnabled
                          ? Colors
                                .black //Theme.of(context).primaryColor
                          : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: _isNextEnabled ? Colors.white : Colors.black38,
                        // color: Colors.white, //: Colors.black38,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
