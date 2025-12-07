import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/authentication/password_screen.dart';
import 'package:twitter_clone/features/onboarding/widgets/interest_button.dart';

const musics = [
  "Rap",
  "R&B soul",
  "Grammy Awards",
  "Pop",
  "K-Pop",
  "Music industry",
  "EDM",
  "Music news",
  "Hip hop",
  "Reggae",
];

const entertainments = [
  "Anime",
  "Movies & TV",
  "Harry Potter",

  "Marvel Universe",
  "Movie news",
  "Naruto",
  "Movies",
  "Grammy Awards",
  "Entertainment",
];

class InterestsTwoScreen extends StatefulWidget {
  const InterestsTwoScreen({super.key});

  @override
  State<InterestsTwoScreen> createState() => _InterestsTwoScreenState();
}

class _InterestsTwoScreenState extends State<InterestsTwoScreen> {
  void _onNaxtTap() {
    // print("🎉 SIGN UP COMPLETE!");
    // MaterialPageRoute(builder: (context) => InterestsTwoScreen());
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PasswordScreen(),

        // InterestsTwoScreen(email: _formData["email"]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: FaIcon(FontAwesomeIcons.twitter)),
      body: SafeArea(
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
                'Interests are used to personalize your experience and will be visible on your profile.',
              ),
              // Text('Enter it below to verify\n${widget.email}'),
              Gaps.v16,
              Divider(height: 1, thickness: 0.5, color: Colors.grey.shade400),

              Gaps.v24,
              const Text(
                'Music',
                style: TextStyle(
                  fontSize: Sizes.size16 + Sizes.size2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v24,
              Wrap(
                runSpacing: 5,
                spacing: 10,
                children: [
                  for (var music in musics) InterestButton(interest: music),
                ],
              ),
              Gaps.v24,
              Divider(height: 1, thickness: 0.5, color: Colors.grey.shade400),
              Gaps.v24,
              const Text(
                'Entertainment',
                style: TextStyle(
                  fontSize: Sizes.size16 + Sizes.size2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v24,
              Wrap(
                runSpacing: 5,
                spacing: 10,
                children: [
                  for (var entertainment in entertainments)
                    InterestButton(interest: entertainment),
                ],
              ),
              Gaps.v24,
              Divider(height: 1, thickness: 0.5, color: Colors.grey.shade400),
            ],
          ),
        ),
      ),

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
