import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/authentication/password_screen.dart';
import 'package:twitter_clone/features/onboarding/widgets/interest_row.dart';

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
  // "Reggae",
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
  List<List<String>> _chunk(List<String> list, int size) {
    List<List<String>> chunks = [];
    for (int i = 0; i < list.length; i += size) {
      chunks.add(
        list.sublist(i, i + size > list.length ? list.length : i + size),
      );
    }
    return chunks;
  }

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

              // Wrap(
              //   runSpacing: 5,
              //   spacing: 10,
              //   children: [
              //     for (var music in musics) InterestButton(interest: music),
              //   ],
              // ),
              // SizedBox(
              //   height: 48,
              //   child: ListView.separated(
              //     scrollDirection: Axis.horizontal,
              //     padding: EdgeInsets.zero,
              //     itemCount: musics.length,
              //     itemBuilder: (context, index) {
              //       final music = musics[index];
              //       return InterestButton(interest: music);
              //     },
              //     separatorBuilder: (context, index) =>
              //         const SizedBox(width: 10),
              //   ),
              // ),
              // Column(
              //   children: [
              //     InterestRow(musics.sublist(0, 3)),
              //     Gaps.v3,
              //     InterestRow(musics.sublist(3, 6)),

              //     Gaps.v3,
              //     InterestRow(musics.sublist(6, 10)),
              //   ],
              // ),
              Column(
                children: [
                  for (final row in _chunk(musics, 3)) ...[
                    InterestRow(row),
                    Gaps.v3,
                  ],
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
              // Wrap(
              //   runSpacing: 5,
              //   spacing: 10,
              //   children: [
              //     for (var entertainment in entertainments)
              //       InterestButton(interest: entertainment),
              //   ],
              // ),
              Column(
                children: [
                  for (final row in _chunk(entertainments, 3)) ...[
                    InterestRow(row),
                    Gaps.v3,
                  ],
                ],
              ),
              Gaps.v24,
              Divider(height: 1, thickness: 0.5, color: Colors.grey.shade400),
            ],
          ),
        ),
      ),

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
                Padding(
                  // padding: const EdgeInsets.only(left: 24),
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    '',
                    // '${_selectedInterests.length} of 3 selected',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 24),
                //   child: Text(
                //     '0 of 3 selected',
                //     // '${_selectedInterests.length} of 3 selected',
                //     style: const TextStyle(fontSize: 14),
                //   ),
                // ),
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
        ),
      ),
    );
  }
}
